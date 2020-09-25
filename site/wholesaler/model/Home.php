<?php

lib_use(LIB_HELP_PHPMAILER);

class Home extends Main {
    private $folder, $pament_method;
    function __construct() {
        parent::__construct ();
    }
    function index() {
        $where = "a.status=1 AND a.type=4 AND a.taxonomy_id=3";
        $paging = new vsc_pagination($this->pdo->count_item('pages', $where), 20);
        $limit = $paging->get_page_limit();
        $all_page=$this->pdo->count_item('pages', $where);
        $result = $this->page->get_one_page($where, $limit);  
        $this->smarty->assign('result', $result);
        $this->smarty->assign('all_page', $all_page);
        
        /* GET LIST EVENT */
        $sql = "SELECT a.image,a.banner,a.url FROM events a LEFT JOIN taxonomy b ON a.taxonomy_id=b.id
                WHERE a.status=1 AND b.type='event' AND b.alias='daisanmall'
                ORDER BY a.sort ASC";
        $event = $this->pdo->fetch_all($sql);
        foreach ($event AS $k=>$item){
            $event[$k]['desktop'] = $this->img->get_image('images/events/', $item['banner']);
            $event[$k]['mobile'] = $this->img->get_image('images/events/', $item['image']);
        }
        $this->smarty->assign("event", $event);
        
        $a_slider = $this->media->get_images(2, 2, 6);
        $this->smarty->assign('a_slider', $a_slider);
        
        $this->smarty->display(LAYOUT_HOME);
    }
    function ajax_load_page_tax() {
        $tax_id = isset ( $_GET ['tax_id'] ) ? intval ( $_GET ['tax_id'] ) : 0;
        $where = "a.status=1 AND a.type=4";
        if($tax_id!=0) $where.=" AND a.taxonomy_id=$tax_id";
        $result = $this->page->get_one_page($where, 20);  
        $this->smarty->assign('result', $result);
        $this->smarty->display ( 'none.tpl' );
        
    }
    function ajax_loadmore_page(){
        $tax_id = isset ( $_POST ['tax_id'] ) ? intval ( $_POST ['tax_id'] ) : 0;
        $where = "a.status=1 AND a.type=4";
        if($tax_id!=0) $where.=" AND a.taxonomy_id=$tax_id";
        $limit = 20;
        $page = isset($_POST['page']) ? trim($_POST['page']) : 1;
        $start = ($page - 1) * $limit;
        $result = $this->page->get_one_page($where, "$start,$limit");
        $this->smarty->assign('result', $result);
        $this->smarty->display(LAYOUT_NONE);
    }
    function ajax_load_product_recommen(){
        $limit = isset($_GET['limit'])?intval($_GET['limit']):24;
        $sql = "SELECT a.id,a.name,a.images,u.name AS unit,a.minorder,a.page_id,
				IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price ASC LIMIT 1), 0) AS price,
                IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price DESC LIMIT 1), 0) AS pricemax
				FROM products a
                LEFT JOIN pages b ON b.id=a.page_id
                LEFT JOIN taxonomy u ON u.id=a.unit_id AND u.type='product_unit'
				WHERE a.status=1 AND b.status=1 AND a.ismain=1 AND b.package_id !=0 ORDER BY a.views ASC LIMIT $limit";
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $result[$k]['avatar'] = $this->product->get_avatar($item['id'], $item['images']);
            $result[$k]['url'] = $this->product->get_url($item['id'], $item['name']);
            $result[$k]['unit'] = $item['unit']=='' ? 'piece' : $item['unit'];
            $result[$k]['pricemax'] = $item['price']==$item['pricemax']?0:$item['pricemax'];
            $result[$k]['price'] = $item['price'] == 0 ? "1-999" : number_format($item['price']);
        }
        $this->smarty->assign('result', $result);
        $this->smarty->display(LAYOUT_NONE);
    }
}