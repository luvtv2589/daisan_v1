<?php

class Event extends Main {
    public $page_id, $profile, $page_url, $sour, $menu;
    function __construct() {
        parent::__construct();
    }
    
    function index() {
        $sql = "SELECT a.* FROM events a
                WHERE a.status=1 AND a.date_start<='".date('Y-m-d')."' AND a.date_finish>='".date('Y-m-d')."'
                ORDER BY a.sort ASC";
        $paging = new vsc_pagination($this->pdo->count_item('events', null), 12);
        $sql = $paging->get_sql_limit($sql);
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $result[$k]['avatar'] = $this->img->get_image('images/events/', $item['image']);
            $result[$k]['url'] =DOMAIN."event/".$this->str->str_convert($item['name'])."-".$item['id'];
           // $result[$k]['url'] ="?mod=event&site=products&id=".$item['id'];
        }
        $this->smarty->assign("result", $result);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    function products(){
        $id = isset($this->_get['id']) ? $this->_get['id'] : 0;
        $id  = explode("-",$id);
        $id = end($id);
        $sql_event = "SELECT a.* FROM events a WHERE a.id=$id";
        
        $event = $this->pdo->fetch_one($sql_event);
        $event['date_finish'] = date("Y/m/d",strtotime($event['date_finish'])+7*3600);
        $event['image'] = $this->img->get_image('images/events/', $event['image']);
        $event['banner'] = $this->img->get_image('images/events/', $event['banner']);
        $this->smarty->assign("event",$event);
        
        $sql = "SELECT a.*,p.name,p.images,u.name AS unit FROM eventproducts a
                LEFT JOIN products p ON p.id=a.product_id
                LEFT JOIN taxonomy u ON u.id=p.unit_id
                WHERE a.event_id=$id AND a.status=1 ORDER BY a.id DESC";
        $paging = new vsc_pagination($this->pdo->count_item('eventproducts', 'event_id='.$id), 24);
        $sql = $paging->get_sql_limit($sql);
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $result[$k]['avatar'] = $this->product->get_avatar($item['product_id'], $item['images']);
            $result[$k]['url'] = $this->product->get_url($item['product_id'], $this->str->str_convert($item['name']))."?eventproduct_id=".$item['id'];
            // $result[$k]['url'] = $this->product->get_url($item['product_id'], $item['name'])."&eventproduct_id=".$item['id'];
            $result[$k]['percent'] = round((1- $item['promo']/$item['price'])*100) ."%";
        }
        $this->get_seo_metadata(@$event['name'], @$event['description'], @$event['name'], @$event['image']);
        $out = array();
        $this->smarty->assign('out', $out);
        $this->smarty->assign("result", $result);
        
        $this->smarty->display('detail.tpl');
    }
    function ajax_load_product_tax() {
        $tax_id = isset ( $_GET ['tax_id'] ) ? intval ( $_GET ['tax_id'] ) : 0;
        $where = "1=1";
        if($tax_id!=0) $where .= " AND p.taxonomy_id IN (".implode(",", $this->tax->get_subcategory($tax_id)).")";
        $sql = "SELECT a.*,p.name,p.images,u.name AS unit FROM eventproducts a
                LEFT JOIN products p ON p.id=a.product_id
                LEFT JOIN taxonomy u ON u.id=p.unit_id
                WHERE $where ORDER BY a.id DESC";
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $result[$k]['avatar'] = $this->product->get_avatar($item['product_id'], $item['images']);
            $result[$k]['url'] = $this->product->get_url($item['product_id'], $this->str->str_convert($item['name']))."?eventproduct_id=".$item['id'];
            // $result[$k]['url'] = $this->product->get_url($item['product_id'], $item['name'])."&eventproduct_id=".$item['id'];
            $result[$k]['percent'] = round((1- $item['promo']/$item['price'])*100) ."%";
        }
        $this->smarty->assign('result', $result);
        $this->smarty->display ( 'none.tpl' );
        
    }
    function adsclick(){
        global $login;
        $id = isset($_GET['id'])?intval($_GET['id']):0;
        $product = $this->pdo->fetch_one("SELECT p.id,p.name,p.page_id,a.campaign_id,a.id AS adsproduct_id,a.score
                FROM adsproducts a
                LEFT JOIN adscampaign b ON a.campaign_id=b.id
                LEFT JOIN products p ON a.product_id=p.id
                LEFT JOIN pages pa ON a.page_id=pa.id
                WHERE a.product_id=$id AND b.status=1 AND a.status=1 AND p.status=1 AND pa.status=1 AND pa.score_ads>0");
        if($product){
            $data = array();
            $data['page_id'] = $product['page_id'];
            $data['campaign_id'] = $product['campaign_id'];
            $data['product_id'] = $product['id'];
            $data['score'] = $product['score'];
            $data['user_ip'] = getenv('HTTP_CLIENT_IP')?:
            getenv('HTTP_X_FORWARDED_FOR')?:
            getenv('HTTP_X_FORWARDED')?:
            getenv('HTTP_FORWARDED_FOR')?:
            getenv('HTTP_FORWARDED')?:
            getenv('REMOTE_ADDR');
            $data['user_id'] = $login;
            $ip = $_SERVER['REMOTE_ADDR'];
            $details = json_decode(file_get_contents("http://ipinfo.io/{$ip}/json"));
            $data['user_location'] = $details->city.', '.$details->country;
            $data['date_click'] = date('Y-m-d');
            $data['created'] = time();
            $this->pdo->insert('adsclicks', $data);
            unset($data);
            
            $this->pdo->query('UPDATE adsproducts SET number_click=number_click+1 WHERE id='.$product['adsproduct_id']);
            $this->pdo->query('UPDATE pages SET score_ads=score_ads-'.$product['score'].' WHERE id='.$product['page_id']);
            
            $url = $this->product->get_url($product['id'], $product['name']);
            lib_redirect($url);
        }else{
            lib_redirect_back();
        }
    }
}