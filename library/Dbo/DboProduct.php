<?php

# ======================================== #
# Class DboService
# The libraries of class Service
# ======================================== #
class DboProduct{
    
    private $pdo, $str, $img, $taxonomy, $page;
    private $number_img_in_folder = 250;
    public $dir_img;
    public $warranty, $status, $order_status, $a_score, $ad_position;
    
    function __construct(){
        $this->pdo = new vsc_pdo();
        $this->str = new vsc_string();
        $this->img = new vsc_image();
        $this->taxonomy = new DboTaxonomy();
        $this->page = new DboPage();
        
        $this->dir_img = "pages/";
        $this->warranty = array(
            1 => "1 Tháng",
            2 => "2 Tháng",
            3 => "3 Tháng",
            6 => "6 Tháng",
            12 => "12 Tháng",
            18 => "18 Tháng",
            24 => "24 Tháng",
            36 => "36 Tháng",
            60 => "60 Tháng"
        );
        
        $this->order_status = array(
            0 => 'Đơn hàng mới',
            1 => 'Đang xử lý',
            2 => 'Giao hàng',
            3 => 'Thành công',
            4 => 'Hủy bỏ',
            5 => 'Trả lại'
        );
        
        $this->status = array(
            0 => "Chờ kích hoạt",
            1 => "Active",
            2 => 'Đang bị khóa'
        );
        
        $this->ad_position = array(
            1 => 'Top header',
            2 => 'Ad footer',
            3 => 'Top hot sidebar'
        );
    }
    
    
    function get_list($page_id=0, $category_id=0, $where=null, $limit=null, $page_url=null, $order = null){
        if($page_id!=0 && $page_url==null) $page_url = URL_PAGE."?pageId=".$page_id;
        
        $where = $where!=null?" AND $where":null;
        $sql = "SELECT a.id,a.name,a.images,a.trademark,a.ordertime,u.name AS unit,c.name AS category,a.minorder,a.page_id,
                a.ismain,a.featured,a.taxonomy_id,
                IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price ASC LIMIT 1), 0) AS price,
                IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price DESC LIMIT 1), 0) AS pricemax
				FROM products a
                LEFT JOIN pages b ON b.id=a.page_id
                LEFT JOIN taxonomy u ON u.id=a.unit_id AND u.type='product_unit'
                LEFT JOIN taxonomy c ON c.id=a.taxonomy_id AND c.type='product'
				WHERE a.status=1 AND b.status=1 $where";
        if($page_id!=0) $sql .= " AND a.page_id=$page_id";
        if($category_id!=0){
            $sql .= " AND a.taxonomy_id IN (SELECT id FROM taxonomy WHERE type='product'
                AND (lft BETWEEN (SELECT lft FROM taxonomy WHERE id=$category_id) AND (SELECT rgt FROM taxonomy WHERE id=$category_id))
                ORDER BY lft)";
        }
        if($order!= null) $sql .= " ORDER BY $order";
        if($limit!=null) $sql .= " LIMIT $limit";
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $a_images = explode(";", $item['images']);
            $result[$k]['avatar'] = URL_IMAGE_S3 . $this->get_folder_img_s3($item['id']) .'270x270/' . @$a_images[0];
           // $result[$k]['avatar'] = $this->get_avatar($item['id'], $item['images']);
            $result[$k]['url'] = $this->get_url($item['id'], $item['name'], $page_url);
            $result[$k]['url_addcart'] = "?mod=product&site=addcart&pid=".$item['id'];
            $result[$k]['url_page'] = $this->page->get_pageurl($item['page_id']);
            $result[$k]['unit'] = $item['unit']=='' ? 'piece' : $item['unit'];
            $result[$k]['pricemax'] = @$item['price']==@$item['pricemax']?0:number_format(@$item['pricemax']);
            $result[$k]['price'] = @$item['price'] == 0 ? "Liên hệ" : number_format(@$item['price']);
        }
        return $result;
    }
    
    
    function get_list_bypage($page_id){
        $page_url = URL_PAGE."?pageId=".$page_id;
        
        $sql = "SELECT a.id,a.name,a.images,a.trademark,u.name AS unit,a.minorder,a.page_id,
                a.ismain,a.featured,a.taxonomy_id,
                IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price ASC LIMIT 1), 0) AS price,
                IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price DESC LIMIT 1), 0) AS pricemax
				FROM products a force index (name,package)
                LEFT JOIN taxonomy u ON u.id=a.unit_id AND u.type='product_unit'
				WHERE a.status=1 AND a.page_id=$page_id  ORDER BY a.id DESC";
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $a_images = explode(";", $item['images']);
            $result[$k]['avatar'] = URL_IMAGE_S3 . $this->get_folder_img_s3($item['id']) .'270x270/' . @$a_images[0];
            //$result[$k]['avatar'] = $this->get_avatar($item['id'], $item['images']);
            $result[$k]['url'] = $this->get_url($item['id'], $item['name'], $page_url);
            $result[$k]['unit'] = $item['unit']=='' ? 'piece' : $item['unit'];
            $result[$k]['pricemax'] = $item['price']==$item['pricemax']?0:$item['pricemax'];
            $result[$k]['price'] = $item['price'] == 0 ? "Liên hệ" : number_format($item['price']);
        }
        return $result;
    }
    
    
    
    function get_list_inarray(array $arr_id){
        $a_sql = array();
        foreach ($arr_id AS $item){
            $a_sql[] = "SELECT a.id,a.name,a.images,a.trademark,a.ordertime,u.name AS unit,c.name AS category,a.minorder
    				FROM products a force index (name,package)
                    LEFT JOIN pages b ON b.id=a.page_id
                    LEFT JOIN taxonomy u ON u.id=a.unit_id AND u.type='product_unit'
                    LEFT JOIN taxonomy c ON c.id=a.taxonomy_id AND c.type='product'
    				WHERE a.id=$item";
        }
        
        $result = $this->pdo->fetch_all(implode(" UNION ALL ", $a_sql));
        foreach ($result AS $k=>$item){
            $result[$k]['avatar'] = $this->get_avatar($item['id'], $item['images']);
            $result[$k]['url'] = $this->get_url($item['id'], $item['name']);
            $result[$k]['url_addcart'] = "?mod=product&site=addcart&pid=".$item['id'];
            $result[$k]['unit'] = $item['unit']=='' ? 'piece' : $item['unit'];
            $result[$k]['pricemax'] = $item['price']==$item['pricemax']?0:$item['pricemax'];
            $result[$k]['price'] = $item['price'] == 0 ? "Liên hệ" : number_format($item['price']);
        }
        return $result;
    }
    
    function get_adsproducts($key_id=0, $tax_id=0, $limit=null, $notid=array()){
        global $location;
        $today = date("Y-m-d");
        $where = null;
        if(count($notid)>0) $where .= " AND a.id NOT IN (".implode(',', $notid).")";
        if($key_id!=0 || $tax_id!=0){
            //$where .= " AND (FIND_IN_SET($key_id, a.keyword) OR a.taxonomy_id=$tax_id)";
            $where .= " AND (FIND_IN_SET($key_id, a.keyword) OR a.taxonomy_id IN (SELECT id FROM taxonomy WHERE type='product'
                AND (lft BETWEEN (SELECT lft FROM taxonomy WHERE id=$tax_id) AND (SELECT rgt FROM taxonomy WHERE id=$tax_id))
                ORDER BY lft))";
        }
        if($location!=0) $where .= " AND (a.page_id IN (SELECT ad.page_id FROM pageaddress ad WHERE ad.status=1 AND ad.province_id=$location) OR a.page_id IN (SELECT p.id FROM pages p WHERE p.status=1 AND p.province_id=$location))";
        $sql = "SELECT a.id,a.name,a.images,a.trademark,a.page_id,a.ordertime,u.name AS unit,t.name AS category,a.minorder,
                a.ability,pa.name AS pagename,pa.address AS pageaddress,pa.phone,pa.isphone,pa.date_start,c.score_daily,
                IFNULL((SELECT l.Name FROM locations l WHERE l.Id = pa.province_id LIMIT 1),0) AS Location,
                IFNULL((SELECT SUM(ac.score) FROM adsclicks ac WHERE ac.campaign_id=b.campaign_id AND ac.date_click='".date('Y-m-d')."'), 0) AS total_today,
                IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price ASC LIMIT 1), 0) AS price,
                IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price DESC LIMIT 1), 0) AS pricemax
                FROM adsproducts b
                LEFT JOIN products a ON a.id=b.product_id
                LEFT JOIN adscampaign c ON c.id=b.campaign_id
                LEFT JOIN taxonomy u ON u.id=a.unit_id AND u.type='product_unit'
                LEFT JOIN taxonomy t ON t.id=a.taxonomy_id AND t.type='product'
                LEFT JOIN pages pa ON pa.id=a.page_id
                WHERE a.status=1 AND b.status=1 AND c.status=1 AND pa.status=1 AND pa.score_ads>0
                    AND c.date_start<='$today' AND c.date_finish>='$today' $where
                HAVING score_daily>total_today
                ORDER BY b.score DESC LIMIT $limit";
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $a_images = explode(";", $item['images']);
            $result[$k]['avatar'] = URL_IMAGE_S3 . $this->get_folder_img_s3($item['id']) .'270x270/' . @$a_images[0];
            //$result[$k]['avatar'] = $this->get_avatar($item['id'], $item['images']);
            $result[$k]['url'] = "?mod=product&site=adsclick&id=".$item['id'];
            $result[$k]['url_addcart'] = "?mod=product&site=addcart&pid=".$item['id'];
            $result[$k]['url_page'] = $this->page->get_pageurl($item['page_id']);
            $result[$k]['unit'] = $item['unit']=='' ? 'piece' : $item['unit'];
            $result[$k]['pricemax'] = $item['price']==$item['pricemax']?0:number_format($item['pricemax']);
            $result[$k]['price'] = $item['price'] == 0 ? "Liên hệ" : number_format($item['price']);
            $result[$k]['yearexp'] = $this->page->get_yearexp($item['date_start']);
            $result[$k]['name']=$this->get_title($item['name'],$key);
            if($this->pdo->check_exist("SELECT 1 FROM pageaddress WHERE province_id=$location AND page_id=".$item['page_id']))
                $result[$k]['info_page']=$this->page->info_page_location($item['page_id'],$location);
        }
        return $result;
    }
   
    function get_detail($detail=array()){
        $detail = is_array($detail) ? $detail : array();
        if(count($detail)>0){
            $detail['avatar'] = $this->get_avatar($detail['id'], $detail['images']);
            $detail['url'] = $this->get_url($detail['id'], $detail['name']);
            $detail['url_addcart'] = "?mod=product&site=addcart&pid=".$detail['id'];
        }
        return $detail;
    }
    
    function get_product_fullvalue($category_id=0, $where=null, $limit=null){
        $where = $where!=null?" AND $where":null;
        $sql = "SELECT a.id,a.name,a.images,a.trademark,a.ordertime,a.ability,a.page_id,a.minorder,
				b.name AS pagename,b.address AS pageaddress,
				(SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price ASC LIMIT 1) AS price,
				(SELECT t.name FROM taxonomy t WHERE t.id=a.taxonomy_id) AS category
				FROM products a LEFT JOIN pages b ON b.id=a.page_id
				WHERE a.status=1 AND b.status=1";
        if($category_id!=0){
            $a_category_id = $this->taxonomy->get_all_category_id($category_id);
            $sql .= " AND a.taxonomy_id IN (".implode(",", $a_category_id).")";
        }
        if($where!=null) $sql .= $where;
        if($limit!=null) $sql .= " LIMIT $limit";
        
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $result[$k]['avatar'] = $this->get_avatar($item['id'], $item['images']);
            $result[$k]['url'] = "?mod=product&site=detail&pid=".$item['id'];
            $result[$k]['url_addcart'] = "?mod=product&site=addcart&pid=".$item['id'];
            $result[$k]['url_page'] = URL_PAGE."?PageId=".$item['page_id'];
        }
        return $result;
    }
    function get_product_keyword($where){
        $where = ($where==''||$where==null) ? "1=1" : $where;
        $sql = "SELECT name FROM keywords WHERE $where";
        $result = $this->pdo->fetch_all($sql);
        $a_field = array();
        foreach ($result AS $k=>$item){
            $a_field[$k]['name'] = $item['name'];
            $a_field[$k]['url'] = "product?k=".str_replace(" ","+", trim($item['name']))."&t=0";
        }
        return $a_field;
    }
    
//     function get_url($id, $name=null, $page_url=null){
//         $url = "?mod=product&site=detail&pid=".$id."&pname=".$this->str->str_convert($name);
//         if($page_url!=null){
//             $sour = substr_count($page_url, '?')>0?'&':'?';
//             $url = $page_url.$sour."site=product_detail&pid=".$id."&pn=".$this->str->str_convert($name);
//         }else $url = DOMAIN.$url;
//         return $url;
//     }
    function get_url($id, $alias=null, $type='product'){
        $url = DOMAIN;
        if($alias==null) $url .= $type."/".$id;
        else $url .= $this->str->str_convert($alias)."-".$id.".html";
        return $url;
    }
    
    function get_avatar($product_id, $images=null){
        $a_image = explode(";", $images);
        return $this->img->get_image($this->get_folder_img($product_id), @$a_image[0]);
    }
    
    function get_folder_img($id){
        $result = $this->pdo->fetch_one("SELECT page_id FROM products WHERE id=".$id);
        return $this->dir_img.$result['page_id']."/";
    }
    
    
    function get_folder_img_upload($id){
        return DIR_UPLOAD.$this->get_folder_img($id);
    }
    function get_folder_img_upload_s3($id){
        return '/'.DIR_UPLOAD_S3.$this->get_folder_img($id);
    }
    
    function set_score(){
        $a_score = array(
            'view' => 1,
            'favorites' => 2,
            'contact' => 5,
            'order' => 5,
            'order_success' => 7,
            'page_v1' => 300,
            'page_v2' => 500,
            'page_v3' => 1000
        );
        $this->a_score = $a_score;
    }
    
    
    function get_keyword_id($key){
        $id = 0;
        if(strlen($key)>2 && strlen($key)<=50){
            $keyword = $this->pdo->fetch_one("SELECT id FROM keywords WHERE name='$key'");
            $id = intval(@$keyword['id']);
            if(!$keyword){
                $data = array();
                $data['name'] = $key;
                $data['created'] = time();
                $id = $this->pdo->insert('keywords', $data);
            }
        }
        return $id;
    }
    function get_title($title, $key)
    {
        $a_words = explode(" ", $key);
        foreach ($a_words as $k => $value) {
            if (strpos(strtoupper($title), strtoupper($value)) !== false) {
                $title = str_replace($value, "<font color='#f60'>" . $value . "</font>", $title);
            }
        }
        return $title;
    }
    function get_product_price($price, $promo=0, $prefix="đ"){
        $nbsp='';
        $value = "<span class=\"price\">Liên hệ</span>";
        if(intval($price)!=$promo){
            $value = "<span class=\"price\">".number_format(intval($promo))."$prefix</span>";
            $value .= "&nbsp;<span class=\"price\">&nbsp;-&nbsp;".number_format(intval($price))."$prefix </span>";
        }elseif(intval($promo)!=0){
            $value = "<span class=\"price\">".number_format(intval($price))."$prefix</span>";
        }
        return $value;
    }

    function get_folder_img_s3($id){
        $result = $this->pdo->fetch_one("SELECT page_id FROM products WHERE id=".$id);
        return $this->dir_img.$result['page_id']."/";
    }

}