<?php

use Sunra\PhpSimple\HtmlDomParser;
lib_use(LIB_HELP_HTMLDOM);

class Autorun extends Admin {

    private $dom;
    private $file_waitinglinks, $file_scannedlinks, $file_savedlinks;
    
    function __construct() {
        parent::__construct();

        $this->file_waitinglinks = "./file_autorun/waitinglinks.ini";
        $this->file_scannedlinks = "./file_autorun/scannedlinks.ini";
        $this->file_savedlinks = "./file_autorun/savedlinks.ini";
    }

    function index() {
        global $smarty, $login;

        $smarty->display(LAYOUT_DEFAULT);
    }

    
    function autorun_start(){
        $limit = 20;
        $url = isset($_POST['url']) ? trim($_POST['url']) : '';
        $restart = isset($_POST['restart']) ? intval($_POST['restart']) : 0;
        $a_url = array();
        if($restart==0) $a_url[] = $url;
        else{
            $a_url = @parse_ini_file($this->file_waitinglinks);
            if(!is_array($a_url) || count($a_url)==0) $a_url = array();
            elseif (count($a_url)>$limit) $a_url = array_splice($a_url, 0, $limit);
        }
        
        $rt['number'] = 0;
        if(count($a_url)>0){
            $_SESSION['AUTORUN_URL_SCAN_LINKS'] = $a_url;
            reset($a_url);
            $rt['url_id'] = key($a_url);
            $rt['str_links'] = $this->get_str_links($_SESSION['AUTORUN_URL_SCAN_LINKS']);
            $rt['number'] = count($a_url);
        }
        echo json_encode($rt); exit();
    }
    
    
    function autorun_handle(){
        $url_id = isset($_POST['url_id']) ? trim($_POST['url_id']) : 0;
        $url = @$_SESSION['AUTORUN_URL_SCAN_LINKS'][$url_id];
        unset($_SESSION['AUTORUN_URL_SCAN_LINKS'][$url_id]);
        
        $html = false;
        if(filter_var($url, FILTER_VALIDATE_URL)) $html = HtmlDomParser::file_get_html($url);
        
        $a_waiting_links = is_file($this->file_waitinglinks)?@parse_ini_file($this->file_waitinglinks):array();
        $a_scanned_links = is_file($this->file_scannedlinks)?@parse_ini_file($this->file_scannedlinks):array();
        
        $a_links = array();
        if($html){
            foreach($html->find('a') as $element){
                $a_links[] = trim($element->href);
            }
            $a_links = $this->get_trueLink($a_links, $url, "q=;sort=;m/p/");
            
            $data['image'] = null;
            foreach ($html->find('.sticky-header__thumbnail img') AS $element){
                $data['image'] = $element->src;
                break;
            }
            if($data['image']!=null && substr_count($data['image'], 'sys_master')<=0){
                $a_img = @explode("/", $data['image']);
                $a_img[3] = "sys_master";
                unset($a_img[4]);
                $data['image'] = implode("/", $a_img);
            }
            $data['name'] = $this->get_html_value($html, "#header-position h1-->0");
            $data['code'] = null;
            $code = $this->get_html_value($html, ".panel-serial-number-->0");
            if($code!=null){
                $a_code = explode(" - ", $code);
                $a_code = explode(":", $a_code[1]);
                $data['code'] = trim($a_code[1]);
                $data['code'] = trim(str_replace(")", "", $data['code']));
                
            }
            $data['brandname'] = $this->get_html_value($html, "#header-position .product-detail__title-brand a-->0");
            $a_cates = $this->get_html_value($html, "#header__breadcrumb li-->array");
            $data['category'] = end($a_cates);
            $data['a_metas'] = $this->get_html_value($html, "#js-product-classifications table td-->array");
            
            $rt = $this->save_product($data);
            if($rt['code']==1){
                $a_savedlinks = is_file($this->file_savedlinks)?@parse_ini_file($this->file_savedlinks):array();
                $a_savedlinks[] = $url;
                file_put_contents($this->file_savedlinks, lib_arr_to_ini($a_savedlinks));
            }
        }
        
        $a_scanned_links[] = $url;
        $a_links = array_diff($a_links, $a_waiting_links);
        $a_links = array_diff($a_links, $a_scanned_links);
        foreach ($a_links AS $item){
            $a_waiting_links[] = $item;
        }
        $a_waiting_links = array_diff($a_waiting_links, $a_scanned_links);
        $a_waiting_links = @array_unique($a_waiting_links);
        $a_waiting_links = @array_values($a_waiting_links);
        @file_put_contents($this->file_waitinglinks, lib_arr_to_ini($a_waiting_links));

        $a_scanned_links = @array_unique($a_scanned_links);
        $a_scanned_links = @array_values($a_scanned_links);
        @file_put_contents($this->file_scannedlinks, lib_arr_to_ini($a_scanned_links));
        
        $a_url = $_SESSION['AUTORUN_URL_SCAN_LINKS'];
        reset($a_url);
        $rt['url_id'] = key($a_url);
        $rt['number'] = count($_SESSION['AUTORUN_URL_SCAN_LINKS']);
        echo json_encode($rt);
        exit();
    }
    
    
    function save_product(array $a_value){
        $brandname = $this->get_true_value(@$a_value['brandname']);
        $page = $this->pdo->fetch_one("SELECT id FROM pages WHERE page_name='".$this->string->str_convert($brandname)."'");
        $page_id = intval(@$page['id']);
        if(!$page && $brandname!='' && $a_value['code']!=null && $a_value['name']!=null){
            $data['name'] = $brandname;
            $data['name_short'] = $brandname;
            $data['page_name'] = $this->string->str_convert($brandname);
            $data['created'] = time();
            $page_id = $this->pdo->insert('pages', $data);
            unset($data);
            
            $data['page_id'] = $page_id;
            $this->pdo->insert('pageprofiles', $data);
            unset($data);
        }
        
        $data['page_id'] = $page_id;
        $data['name'] = $this->get_true_value(@$a_value['name']);
        $data['code'] = $this->get_true_value(@$a_value['code']);
        $data['trademark'] = $brandname;
        $data['created'] = time();
        if($data['code']!=null && $data['name']!=null && $page_id!=0)
            $data['taxonomy_id'] = $this->taxonomy->create('product', $a_value['category'], $this->string->str_convert($a_value['category']));
        
        $rt['code'] = 0;
        if($data['code']==null || $data['name']==null || $page_id==0){
            $rt['msg'] = "Nội dung bị thiếu";
        }elseif($this->pdo->check_exist("SELECT 1 FROM products WHERE code='".$data['code']."'")){
            $rt['msg'] = "Mã sản phẩm đã tồn tại";
        }elseif($this->pdo->check_exist("SELECT 1 FROM products WHERE name='".$data['name']."'")){
            $rt['msg'] = "Tên sản phẩm đã tồn tại";
        }elseif($product_id = $this->pdo->insert('products', $data)){
            $a_metas = array();
            $number = count($a_value['a_metas'])/2;
            for($i=0; $i<$number; $i++){
                $a_metas[$a_value['a_metas'][$i*2]] = $a_value['a_metas'][$i*2+1];
            }
            foreach ($a_metas AS $k=>$item){
                $data['product_id'] = $product_id;
                $data['meta_key'] = $k;
                $data['meta_value'] = $item;
                $this->pdo->insert('productmetas', $data);
                unset($data);
            }
            
            $data['images'] = $this->img->upload_image_fromurl($this->product->get_folder_img($product_id), @$a_value['image'], 600, 1);
            $this->pdo->update('products', $data, "id=$product_id");
            
            
            $rt['code'] = 1;
            $rt['msg'] = "Lưu sản phẩm thành công";
        }else{
            $rt['msg'] = "Không lưu được sản phẩm";
        }
        unset($data);
        return $rt;
    }
    
    
    function get_true_value($str){
        $str = str_replace("&nbsp;", "", $str);
        return $str;
    }
    
    
    function load_pagecontent(){
        $url = isset($_POST['url'])?trim($_POST['url']):null;
        $data = $this->get_page_content($url);
        $this->smarty->assign('data', $data);
        
        $this->smarty->display(LAYOUT_NONE);
    }
    
    
    function get_page_content($url, $prefix=null){
        $html = false;
        if(filter_var($url, FILTER_VALIDATE_URL)) $html = HtmlDomParser::file_get_html($url);
        
        $data = array();
        $data['url'] = $url;
        $data['a_links'] = array();
        if($html){
            $ex_prefix = explode("&&", $prefix);
            foreach ($ex_prefix AS $item){
                $ex_item = explode(":", $item);
                if(count($ex_item)==2) $a_prefix[$ex_item[0]] = $ex_item[1];
            }
            
            foreach($html->find('a') as $element){
                $data['a_links'][] = trim($element->href);
            }
            $data['a_links'] = $this->get_trueLink($data['a_links'], $url);
            
            $data['name'] = $this->get_html_value($html, "title-->0");
            if(isset($a_prefix['name']) && $a_prefix['name']!=null)
                $data['name'] = $this->get_html_value($html, $a_prefix['name']);
                
                
                $data['image'] = null;
                foreach($html->find("meta[property=og:image]") as $element){
                    $data['image'] = trim($element->content);
                }
                if(isset($a_prefix['image']) && $a_prefix['image']!=null){
                    foreach ($html->find($a_prefix['image']) AS $element){
                        $data['image'] = $element->src;
                        break;
                    }
                }
        }
        return $data;
    }
    
    
    /**
     * 
     * @param object $html
     * @param string $prefix
     * @return string
     */
    function get_html_value($html, $prefix=null){
        $str = null;
        if($prefix!=null){
            if(strpos($prefix, '||')!==false){//Lấy giá trị hoặc
                $a_prefix = explode("||", $prefix);
                foreach ($a_prefix AS $item){
                    $str = $this->get_html_value($html, $item);
                    if($str!=null && $str!='') break;
                }
            }else{
                $nth = 0;
                $pre_remove = null;
                if(strpos($prefix, '---')!==false){//Loại bỏ giá trị con
                    $a_prefix = explode("---", $prefix);
                    $prefix = $a_prefix[0];
                    $pre_remove = $a_prefix[1];
                }
                if(strpos($prefix, '-->')!==false){//Lấy theo thứ tự
                    $a_prefix = explode("-->", $prefix);
                    $nth = $a_prefix[1];
                    $prefix = $a_prefix[0];
                }
                if($pre_remove) $html = $this->remove_html_value($html, $prefix." ".$pre_remove);
                if($nth==='n' || $nth=='array'){
                    $a_str = array();
                    foreach($html->find($prefix) AS $element){
                        $a_str[] = trim($element->plaintext);
                    }
                    $str = $a_str;
                    if($nth==='n') $str = trim(implode(" ", @$a_str));
                }else $str = trim(@$html->find(trim($prefix), $nth)->plaintext);
            }
        }
        return $str;
    }
 
    
    function remove_html_value($html, $selector){
        foreach ($html->find($selector) as $node){
            $node->outertext = '';
        }
        return $html->load($html->save());
    }
    
    
    function get_trueLink($a_url, $url=null, $pre_remove=null){
        if(count($a_url)>0){
            $Domain = parse_url($url, PHP_URL_SCHEME)."://".parse_url($url, PHP_URL_HOST);
            $a_url = @array_unique($a_url);
            $a_url = is_array($a_url) ? $a_url : array();
            foreach ($a_url AS $k=>$item){
                $a_item = explode(".", $item);
                $typeurl = end($a_item);
                if($item==''||$item=='/'||$item=='./'||@$item[0]=='#'||@$item[0]=="'") unset($a_url[$k]);
                elseif(substr_count($item, '?')>1||substr_count($item, '"')>0||substr_count($item, '|')>0) unset($a_url[$k]);
                elseif(strpos($item, '{')!==false && strpos($item, '}')!==false) unset($a_url[$k]);
                elseif(@$item[0]=='j'&&@$item[1]=='a'&&@$item[2]=='v'&&@$item[3]=='a') unset($a_url[$k]);
                elseif($url && ($Domain==$item||$Domain."/"==$item||$Domain."/."==$item)) unset($a_url[$k]);
                elseif(strpos($item, 'tel:')!==false||strpos($item, 'skype:')!==false||strpos($item, 'mailto:')!==false) unset($a_url[$k]);
                elseif(strpos($item, '../')!==false) unset($a_url[$k]);
                elseif(in_array(strtoupper($typeurl), array('JPG','JPEG','PNG','GIF','PDF','SWF','RAR','ZIP','TXT','DOC','DOCX','MP4','MP3'))) unset($a_url[$k]);
                elseif($url && filter_var($item, FILTER_VALIDATE_URL) === FALSE){
                    if(!parse_url($item, PHP_URL_SCHEME)){
                        if(@$item[0]=='?'){
                            $a_ex_url = explode("?", $url);
                            $a_url[$k] = $a_ex_url[0] . $item;
                        }elseif(@$item[0]==@$item[1] && @$item[1]=="/"){
                            $a_url[$k] = parse_url($Domain, PHP_URL_SCHEME).":".$item;
                        }elseif(@$item[0]=="." && @$item[1]=="/"){
                            $a_url[$k] = $Domain.substr($item, 1);
                        }else{
                            $item = $Domain . (@$item[0]=='/'?$item:'/'.$item);
                            $a_url[$k] = $item;
                        }
                    }else unset($a_url[$k]);
                }
                
                if(isset($a_url[$k])){
                    if(strlen($a_url[$k])>120) unset($a_url[$k]);
                    elseif(filter_var($a_url[$k], FILTER_VALIDATE_URL) === FALSE) unset($a_url[$k]);
                    elseif($url && parse_url($Domain, PHP_URL_HOST)!=parse_url($a_url[$k], PHP_URL_HOST)) unset($a_url[$k]);
                    elseif(strpos(parse_url($Domain, PHP_URL_HOST), 'http://')!==false||strpos(parse_url($Domain, PHP_URL_HOST), 'https://')!==false) unset($a_url[$k]);
                    elseif($pre_remove && $pre_remove!=''){
                        $a_remove = explode(";", $pre_remove);
                        foreach ($a_remove AS $itemremove){
                            if(strpos($a_url[$k], $itemremove)!==false){
                                unset($a_url[$k]);
                                break;
                            }
                        }
                    }
                }
            }
            @asort($a_url);
        }
        return @array_values($a_url);
    }
    
    
    function get_str_links($a_links){
        $str = "<url id=\"scanlinks\">";
        foreach ($a_links AS $k=>$item){
            $str .= "<li id=\"uid$k\">";
            $str .= "<a href='".@$item."' target='_blank'>";
            $str .= "<i class=\"fa fa-fw fa-link\"></i> ".@$item;
            $str .= "</a>";
            $str .= "</li>";
        }
        $str .= "</ul>";
        return $str;
    }
    
    
}
