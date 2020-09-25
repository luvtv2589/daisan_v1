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
        $out = array();
        $key = isset($_GET['key'])? trim($_GET['key']) : '';
        $key = str_replace("+", " ", $key);
        
        $inputok = $this->check_input($key);
        if ($inputok!=1){
            $this->smarty->display('403.tpl');
            exit();
        }
        $kid = - 1;
        $keyword = $this->pdo->fetch_one("SELECT id FROM keywords WHERE name='$key'");
        if ($keyword && $key != '')
            $kid = $keyword['id'];
        
        $where = "1=1 AND a.page_id IN(SELECT p.id FROM pages p WHERE p.type=8)";   
        if ($key != '') {
        if (count(explode(',', $key)) > 1) {
                $a_key = explode(',', $key);
                $a_key_sql = array();
                foreach ($a_key as $item) {
                    $a_key_sql[] = "a.name LIKE '%" . trim($item) . "%'";
                }
                $where .= " AND (" . implode(' OR ', $a_key_sql) . ')';
         } else
         $where .= " AND (a.name LIKE '%$key%')";
        }
        $sql = "SELECT a.id,a.name,a.code,a.images,a.status,a.created,a.featured,
                (SELECT b.id FROM pages b WHERE b.id=a.page_id) AS page_id,
                (SELECT b.name FROM pages b WHERE b.id=a.page_id) AS page_name,
                (SELECT b.page_name FROM pages b WHERE b.id=a.page_id) AS page_sname,
                MATCH(a.name) AGAINST ('$key') AS Match_title
				FROM products a force index (name) WHERE 
                 (
                 $where
                 )
                 ORDER BY a.created DESC";
        $paging = new vsc_pagination($this->pdo->count_item('products', $where), 50);
        $sql = $paging->get_sql_limit($sql);
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute();
        $result = array();
        while ($item = $stmt->fetch()) {
            $a_images = explode(";", $item['images']);
            $item ['avatar'] = $this->img->get_image($this->product->get_folder_img($item['id']), @$a_images[0]);
            $item['url']=$this->product->get_url($item['id'], $this->str->str_convert($item['name']));
            $item['url_page'] = $this->page->get_pageurl($item['page_id'], $item['page_sname']);
            $result [] = $item;
        }
        $this->smarty->assign("result", $result);
        
        $a_slider = $this->media->get_images(2, 1, 2);
        $this->smarty->assign('a_slider', $a_slider);
        
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_HOME);
    }
    
    function search() {
        $this->smarty->display(LAYOUT_HOME);
    }
    function check_input($key){
        $inputok=1;
        $blacklistChars = '"%\'*;<>?^`{|}~/\\#=&';
        if (preg_match("/[^a-z0-9A-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]/u", $key)){
            $inputok=1;
        }
        
        if(preg_match_all("/select|insert|update|delete|location|script|passwd|shadow|<|>/", $key))
        {
            $inputok=0;
        }
        $pattern = preg_quote($blacklistChars, '/');
        if (preg_match('/[' . $pattern . ']/', $key)) {
            $inputok=0;
        }
        return $inputok;
    }
}