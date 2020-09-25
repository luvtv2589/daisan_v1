<?php

lib_use(LIB_HELP_PHPMAILER);

class Home extends Main {
    private $folder, $pament_method;
    function __construct() {
        parent::__construct ();
        
        $this->folder = "rfq/";
        $this->pament_method = array(
            1 => 'Thanh toán tiền mặt khi giao hàng',
            2 => 'Thanh toán chuyển khoản ATM',
            3 => 'Thanh toán online tự động'
        );
    }
    function index() {
        $where = "a.type='event' AND a.status=1";
        $sql = "SELECT a.id,a.title,a.description,a.time_start,a.time_finish,a.avatar,
				(SELECT t.Name FROM locations t WHERE t.id=a.taxonomy_id) AS category
				FROM posts a WHERE $where ORDER BY a.time_start ASC,a.sort ASC, a.id DESC LIMIT 11";
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute();
        $result = array();
        while ($item = $stmt->fetch()) {
            $item['avatar'] = $this->img->get_image('events/', $item['avatar']);
            $item['url'] = '?mod=home&site=detail&id='.$item['id'];
            $result[] = $item;
        }
        $this->smarty->assign("result", $result);
        
        $a_slider = $this->media->get_images(2, 2, 6);
        $this->smarty->assign('a_slider', $a_slider);
        $a_ad['adhome'] = $this->media->get_images(3,3,6);
        $a_ad['admhome'] = $this->media->get_images(4,3,6);
        $this->smarty->assign('a_ad', $a_ad);
        
        $this->smarty->display(LAYOUT_HOME);
    }
    function detail() {
        $post_id = isset($_GET['id'])?intval($_GET['id']):0;
        $where = "1=1 AND a.post_id=$post_id";
        $where .= " AND b.taxonomy_id IN (".implode(",", $this->tax->get_subcategory(3)).")";
        //     if($key!=null) $where .= " AND (a.name LIKE '%".$_GET['key']."%' OR a.id LIKE '%".$_GET['key']."%')";
        $sql = "SELECT a.*,b.id,b.name,b.address,b.website,b.logo,b.page_name,b.created,b.featured,b.status,b.package_end,b.score_ads,b.nation_id,
                (SELECT n.Image FROM nations n WHERE n.Id=b.nation_id) AS nation_img
                FROM eventpages a LEFT JOIN pages b ON a.page_id=b.id
                WHERE $where ORDER BY a.created DESC LIMIT 50";
        $all_page=$this->pdo->count_rows("SELECT a.*,b.id,b.name,b.address,b.website,b.logo,b.page_name,b.created,b.featured,b.status,b.package_end,b.score_ads,b.nation_id,
                (SELECT n.Image FROM nations n WHERE n.Id=b.nation_id) AS nation_img
                FROM eventpages a LEFT JOIN pages b ON a.page_id=b.id
                WHERE $where ORDER BY a.created DESC");
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute();
        $result = array();
        while ($item = $stmt->fetch()) {
            $item['logo'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo']);
            $item['url'] = $this->page->get_pageurl($item['id'], $item['page_name']);
           // $item['product']=$this->product->get_list($item['page_id'],0,null,4);
            $result [] = $item;
        }
        $this->smarty->assign('result', $result);
        $this->smarty->assign('all_page', $all_page);
        
//         /* GET LIST EVENT */
//         $sql = "SELECT a.image,a.banner FROM events a LEFT JOIN taxonomy b ON a.taxonomy_id=b.id
//                 WHERE a.status=1 AND b.type='event' AND b.alias='daisanmall'
//                 ORDER BY a.sort ASC";
//         $event = $this->pdo->fetch_all($sql);
//         foreach ($event AS $k=>$item){
//             $event[$k]['desktop'] = $this->img->get_image('images/events/', $item['banner']);
//             $event[$k]['mobile'] = $this->img->get_image('images/events/', $item['image']);
//         }
          
        $a_slider = $this->media->get_images(2, 2, 6);
        $this->smarty->assign('a_slider', $a_slider);
        $a_ad['adhome'] = $this->media->get_images(3,3,6);
        $a_ad['admhome'] = $this->media->get_images(4,3,6);
        $this->smarty->assign('a_ad', $a_ad);
        
        $this->smarty->display(LAYOUT_HOME);
    }
    function ajax_load_page_tax() {
        $tax_id = isset ( $_GET ['tax_id'] ) ? intval ( $_GET ['tax_id'] ) : 3;
        $post_id = isset($_GET['post_id'])?intval($_GET['post_id']):0;
        $where = "1=1 AND a.post_id=$post_id ";
        if($tax_id!=0) $where .= " AND b.taxonomy_id IN (".implode(",", $this->tax->get_subcategory($tax_id)).")";
        $sql = "SELECT a.*,b.id,b.name,b.address,b.website,b.logo,b.page_name,b.created,b.featured,b.status,b.package_end,b.score_ads,b.nation_id,
                (SELECT n.Image FROM nations n WHERE n.Id=b.nation_id) AS nation_img
                FROM eventpages a LEFT JOIN pages b ON a.page_id=b.id
                WHERE $where ORDER BY a.created DESC";
        $all_page=$this->pdo->count_item('evenpages', $where);
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute();
        $result = array();
        while ($item = $stmt->fetch()) {
            $item['logo'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo']);
            $item['url'] = $this->page->get_pageurl($item['id'], $item['page_name']);
            $item['product']=$this->product->get_list($item['page_id'],0,null,4);
            $result [] = $item;
        }
        $this->smarty->assign('result', $result);
        $this->smarty->display ( 'none.tpl' );
        
    }
    function ajax_loadmore_page(){
        $tax_id = isset ( $_GET ['tax_id'] ) ? intval ( $_GET ['tax_id'] ) : 3;
        $post_id = isset($_POST['post_id'])?intval($_POST['post_id']):0;
        $where = "1=1 AND a.post_id=$post_id ";
        if($tax_id!=0) $where .= " AND b.taxonomy_id IN (".implode(",", $this->tax->get_subcategory($tax_id)).")";
        $limit = 50;
        $page = isset($_POST['page']) ? trim($_POST['page']) : 1;
        $start = ($page - 1) * $limit;
        $sql = "SELECT a.*,b.id,b.name,b.address,b.website,b.logo,b.page_name,b.created,b.featured,b.status,b.package_end,b.score_ads,b.nation_id,
                (SELECT n.Image FROM nations n WHERE n.Id=b.nation_id) AS nation_img
                FROM eventpages a LEFT JOIN pages b ON a.page_id=b.id
                WHERE $where ORDER BY a.created DESC LIMIT $start,$limit";
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute();
        $result = array();
        while ($item = $stmt->fetch()) {
            $item['logo'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo']);
            $item['url'] = $this->page->get_pageurl($item['id'], $item['page_name']);
            $item['product']=$this->product->get_list($item['page_id'],0,null,4);
            $result [] = $item;
        }
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