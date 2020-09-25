<?php
lib_use(LIB_HELP_PHPMAILER);

class Product extends Main
{
    
    public $page_id, $profile, $page_url, $sour, $menu;
    
    function __construct()
    {
        parent::__construct();
    }
    
    function index()
    {
        global $location;
        $today = date("Y-m-d");
        $out = array();
        $key = isset($_GET['k']) ? trim($_GET['k']) : '';
        $key = str_replace("+", " ", $key);
        
        $inputok = $this->check_input($key);
        if ($inputok!=1){
            $this->smarty->display('403.tpl');
            exit();
        }
        
        $id = isset($this->_get['id']) ? $this->_get['id'] : (isset($_GET['id']) ? intval($_GET['id']) : 0);
        $taxonomy = $this->pdo->fetch_one("SELECT id,name,level FROM taxonomy WHERE type='product' AND alias='$id' OR id='$id'");
        $id = intval($taxonomy['id']);
        $category = $this->tax->get_value($id);
        $a_category = $this->tax->get_taxonomy('product', intval(@$taxonomy['parent']), null, null, 0, 0);
        $this->smarty->assign('taxonomy', $taxonomy);
        $this->smarty->assign('a_category', $a_category);
        
        
        
        
        $location_id = isset($_GET['location_id']) ? trim($_GET['location_id']) : 0;
        $minorder = isset($_GET['minorder']) ? intval($_GET['minorder']) : null;
        $minprice = isset($_GET['minprice']) ? intval($_GET['minprice']) : null;
        $maxprice = isset($_GET['maxprice']) ? intval($_GET['maxprice']) : null;
        $filter_checkbox = isset($_GET['filter_checkbox']) ? trim($_GET['filter_checkbox']) : null;
        $out['a_checkbox'] = explode(",", $filter_checkbox);
        
         $str_meta = @file_get_contents(FILE_INFO_METAS);
         $a_metas = json_decode($str_meta, true);
         
         $subid = $taxonomy['level'] == 2 ? $id : 0;
         $a_metas = isset($a_metas[$subid]) ? $a_metas[$subid] : array();
         $this->smarty->assign('a_metas', $a_metas);
         
         $kid = - 1;
         $keyword = $this->pdo->fetch_one("SELECT id FROM keywords WHERE name='$key'");
         if ($keyword && $key != '')
         $kid = $keyword['id'];
         // $product_ads = $this->product->get_adsproducts($kid, 13);
         $product_ads_index = $this->product->get_adsproducts($kid, $id, 4);
         $a_product_ads = array();
         foreach ($product_ads_index as $item) {
         $a_product_ads[] = $item['id'];
         }
         $this->smarty->assign('product_ads_index', $product_ads_index);
         
         $product_ads = $this->product->get_adsproducts($kid, $id, 10, $a_product_ads);
         foreach ($product_ads as $item) {
         $a_product_ads[] = $item['id'];
         }
         if (count($product_ads) < 10) {
         $product_ads_more = $this->product->get_adsproducts(0, 0, (13 - count($product_ads)), $a_product_ads);
         foreach ($product_ads_more as $item) {
         $a_product_ads[] = $item['id'];
         }
         $product_ads = array_merge($product_ads, $product_ads_more);
         }
         $this->smarty->assign('product_ads', $product_ads);
         
         $where = "a.status=1 AND a.name<>'' AND b.status=1";
         if ($key != '') {
         if (count(explode(',', $key)) > 1) {
         $a_key = explode(',', $key);
         $a_key_sql = array();
         foreach ($a_key as $item) {
         $a_key_sql[] = "a.name LIKE '%" . trim($item) . "%'";
         }
         $where .= " AND (" . implode(' OR ', $a_key_sql) . ')';
         } else
         $where .= " AND (a.name LIKE '%$key%' OR REPLACE(a.name, 'Đ', 'd') LIKE '%$key%' OR MATCH(a.name) AGAINST('$key'))";
         }
         if ($id != 0)
         $where .= " AND a.taxonomy_id IN (" . implode(",", $this->tax->get_subcategory($id)) . ")";
         if ($minorder != 0)
         $where .= " AND a.minorder>=$minorder";
         if (count($a_product_ads))
         $where .= " AND a.id NOT IN (" . implode(',', $a_product_ads) . ")";
         
         if ($filter_checkbox != null && count($out['a_checkbox']) > 0) {
         $a_sql_checkbox = array();
         foreach ($out['a_checkbox'] as $item) {
         $ex_item = explode("-", $item);
         $a_sql_checkbox[] = "(m.meta_key='" . $a_metas[$ex_item[0]]['parent'] . "' AND m.meta_value='" . $a_metas[$ex_item[0]]['sub'][$ex_item[1]] . "')";
         }
         $where .= "AND a.id IN (SELECT m.product_id FROM productmetas m WHERE " . implode(" OR ", $a_sql_checkbox) . ")";
         }
         $where_location = "";
         if ($location != 0) {
         $where_location .= " AND (a.page_id IN (SELECT ad.page_id FROM pageaddress ad WHERE ad.status=1 AND ad.province_id=$location) OR a.page_id IN (SELECT p.id FROM pages p WHERE p.status=1 AND p.province_id=$location))";
         }
         $having = "1=1";
         if ($minprice != 0)
         $having .= " AND price>=$minprice";
         if ($maxprice != 0)
         $having .= " AND pricemax<=$maxprice";
         
         $sql = "SELECT a.id,a.name,a.images,a.ordertime,a.ismain,a.page_id,a.minorder,a.status,
         b.name AS pagename,b.page_name,b.phone,b.isphone,b.package_id,b.address AS pageaddress,c.name AS category,u.name AS unit,b.date_start,
         CASE
         WHEN a.name='$key' THEN 10
         WHEN a.name LIKE '$key%' THEN 6
         WHEN a.name LIKE '%$key' THEN 3
         WHEN a.name LIKE '%$key%' THEN 1
         ELSE 0
         END AS priority,
         CASE WHEN FIND_IN_SET($kid, a.keyword) THEN 10
         ELSE 0
         END AS Mat_keyword,
         CASE
         WHEN b.package_end < '$today' THEN 0
         WHEN b.package_end >= '$today' THEN 1
         ELSE 0
         END AS flag_check,
         MATCH(a.name) AGAINST ('$key') AS Match_title
         FROM products a force index (name)
         LEFT JOIN pages b
         ON b.id=a.page_id
         LEFT JOIN taxonomy c
         ON c.id=a.taxonomy_id
         LEFT JOIN taxonomy u
         ON u.id=a.unit_id
         WHERE
         (
         (
         $where
         )
         OR
         FIND_IN_SET($kid, a.keyword)
         ) $where_location
         HAVING 1=1
         ORDER BY priority DESC,Mat_keyword DESC,a.ismain DESC,Match_title DESC,flag_check DESC,a.score DESC";
         /*
         * $sql = "SELECT a.id,a.name,a.images,a.trademark,a.ordertime,a.ability,a.ismain,a.page_id,a.minorder,
         * b.name AS pagename,b.page_name,b.phone,b.isphone,b.package_id,b.address AS pageaddress,c.name AS category,u.name AS unit,b.date_start,
         * IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price ASC LIMIT 1), 0) AS price,
         * IFNULL((SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price DESC LIMIT 1), 0) AS pricemax,
         * IFNULL((SELECT l.Name FROM locations l WHERE l.Id =b.province_id LIMIT 1),0) AS Location,
         * (SELECT COUNT(1) FROM pageaddress ad WHERE ad.page_id=a.page_id) AS countpage,
         * CASE WHEN a.name='$key' THEN 5 ELSE 0 END AS S1,
         * CASE WHEN a.name LIKE '$key %' THEN 3 ELSE 0 END AS S2,
         * CASE WHEN a.name LIKE '$key%' THEN 1 ELSE 0 END AS S3,
         * CASE WHEN a.name LIKE '% $key %' THEN 1 ELSE 0 END AS S4,
         * CASE WHEN FIND_IN_SET($kid, a.keyword) THEN 10 ELSE 0 END AS S6,
         * MATCH(a.name) AGAINST ('$key') AS Match_title
         * FROM products a LEFT JOIN pages b ON b.id=a.page_id LEFT JOIN taxonomy c ON c.id=a.taxonomy_id
         * LEFT JOIN taxonomy u ON u.id=a.unit_id
         * WHERE ($where) OR (FIND_IN_SET($kid, a.keyword) $where_location) HAVING $having
         * ORDER BY a.ismain DESC,(S1+S2+S3+S4+S6) DESC,a.score DESC";
         */
         
          $out['number'] = $this->pdo->count_rows("SELECT 1 FROM products a LEFT JOIN pages b ON b.id=a.page_id
          WHERE ($where) OR (FIND_IN_SET($kid, a.keyword) $where_location) HAVING $having");
          $paging = new vsc_pagination($out['number'], 80);
          $sql = $paging->get_sql_limit($sql);
          $result = $this->pdo->fetch_all($sql);
          
          $a_price_product=array();
          foreach ($result AS $item){
          $a_price_product[$item['id']]=$this->pdo->fetch_one("SELECT price FROM productprices USE INDEX (price) WHERE product_id=".$item['id']." ORDER BY price ASC LIMIT 1");
          }
          $a_pricemax_product=array();
          foreach ($result AS $item){
          $a_pricemax_product[$item['id']]=$this->pdo->fetch_one("SELECT price FROM productprices USE INDEX (price) WHERE product_id=".$item['id']." ORDER BY price DESC LIMIT 1");
          }
          
          foreach ($result as $k => $item) {
          $result[$k]['avatar'] = $this->product->get_avatar($item['id'], $item['images']);
          $result[$k]['url'] = $this->product->get_url($item['id'], $this->str->str_convert($item['name']));
          $result[$k]['url_addcart'] = "?mod=product&site=addcart&pid=" . $item['id'];
          $result[$k]['url_page'] = $this->page->get_pageurl($item['page_id'], $item['page_name']);
          $result[$k]['unit'] = $item['unit'] == '' ? 'Piece' : $item['unit'];
          $result[$k]['pricemax']=$a_pricemax_product[$item['id']];
          $result[$k]['price']=$a_price_product[$item['id']];
          $result[$k]['showprice'] = $this->product->get_product_price($result[$k]['pricemax']['price'], $result[$k]['price']['price']);
          //          $result[$k]['pricemax'] = $item['price'] == $item['pricemax'] ? 0 : number_format($item['pricemax']);
          //          $result[$k]['price'] = $item['price'] == 0 ? "Xem giá" : number_format($item['price']);
          $result[$k]['yearexp'] = $this->page->get_yearexp($item['date_start']);
          // $result[$k]['name']=$this->product->get_title($item['name'],$key);
          if($this->pdo->check_exist("SELECT 1 FROM pageaddress WHERE province_id=$location AND page_id=".$item['page_id']))
          $result[$k]['info_page']=$this->page->info_page_location($item['page_id'],$location);
          if($this->arg['isadmin']==1 || ($item['package_id']!=0 && $item['isphone']==1))
          $result[$k]['phone'] = $this->option['contact']['phone'];
          }
          
//           $product_file = $this->tax->get_folder_img_upload($id).'products.json';
//           if(!is_file($product_file)){
//               //$products = $this->product->get_list_bypage($this->page_id);
//               file_put_contents($product_file, json_encode($result));
//           }else $products = json_decode(file_get_contents($product_file), true);
          
          $this->smarty->assign('result', $result);
          //             if(!is_file($product_file)){
          //                 $products = $this->product->get_list_bypage($this->page_id);
          //                 file_put_contents($product_file, json_encode($result));
          //             }else $result = json_decode(file_get_contents($product_file), true);
          
          if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'get_info_call') {
              $data = array();
              // $data['email']=$_POST['email'];
              $data['phone']=$_POST['phone'];
              $data['url'] = $_POST['url'];
              $data['date_log'] = date('Y-m-d');
              $data['updated'] = time();
              $data['user_ip'] = $this->str->get_client_ip();
              $data['ismobile'] = $this->isMobile();
              $details = json_decode(file_get_contents("http://ipinfo.io/".$this->str->get_client_ip()."/json"));
              if($details){
                  $a_address = array();
                  if(isset($details->region)) $a_address[] = $details->region;
                  if(isset($details->city)) $a_address[] = $details->city;
                  if(isset($details->country)) $a_address[] = $details->country;
                  $data['location'] = implode(', ', $a_address);
                  unset($a_address);
              }
              $this->pdo->insert('accesslogusers', $data);
          }
          
          if (isset($_COOKIE['HodineCache']))
              $HodineCache = json_decode($_COOKIE['HodineCache'], true);
              else
                  $HodineCache = array();
                  if (! isset($HodineCache['product_view']) || ! is_array($HodineCache['product_view']))
                      $HodineCache['product_view'] = array();
                      $HodineCache['product_view'][] = 0;
                      $a_product_views = $this->product->get_list_inarray($HodineCache['product_view']);
                      $this->smarty->assign('a_product_views', $a_product_views);
                      
                      $out['checkbox_memnumber'] = $this->help->get_checkbox_from_array($this->page->number_mem);
                      $out['checkbox_revenue'] = $this->help->get_checkbox_from_array($this->page->revenue);
                      $out['location'] = $this->help->get_select_location($location_id, 0, 'Chọn tỉnh thành');
                      $out['url'] = "?mod=product&site=index";
                      if ($id != 0) $out['url'] .= "&id=$id";
                      if($location!=0) $out['url'] .="&location=$location";
                      if($key!='') $out['url'].="&k=$key";
                      $out['url_list'] = $out['url']."&type=list";
                      $out['url_grid'] = $out['url']."&type=grid";
                      $out['filter_minorder'] = $minorder;
                      $out['filter_minprice'] = $minprice;
                      $out['filter_maxprice'] = $maxprice;
                      if(@$_GET['type'] == 'list'){
                          $out['url'] .="&type=list";
                          $this->smarty->assign('content', PRODUCT_LIST);
                      }
                      elseif(@$_GET['type']=='grid'){
                          $out['url'] .="&type=grid";
                          $this->smarty->assign('content', PRODUCT_GRID);
                      }
                      $this->get_seo_metadata(@$category['title']?$category['title']:$category['name'], @$category['keyword'], @$category['description'], @$category['image']);
                      $this->smarty->assign('out', $out);
                      $this->smarty->display('detail.tpl');
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
function category()
{
    // $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
    $id = isset($this->_get['id']) ? $this->_get['id'] : (isset($_GET['id']) ? intval($_GET['id']) : 0);
    $taxonomy = $this->pdo->fetch_one("SELECT * FROM taxonomy WHERE type='product' AND alias='$id' OR id='$id'");
    $id = @$taxonomy['id'];
    $category = $this->tax->get_value($id);
    $a_category_all = $this->tax->get_taxonomy('product', $id, null, null, 1, 0);
    $this->smarty->assign('a_category_all', $a_category_all);
    
    $a_category_hot = $this->tax->get_taxonomy('product', $id, null, 11);
    $this->smarty->assign('a_category_hot', $a_category_hot);
    
    $a_product = array();
    $a_product['hot'] = $this->product->get_list(0, $id, "a.featured=1", 5);
    $a_product['new'] = $this->product->get_list(0, $id, null, 5);
    $a_product['topview'] = $this->product->get_list(0, $id, null, 5, null, "a.views DESC");
    $this->smarty->assign("a_product", $a_product);
    
    $a_category_list = $this->tax->get_taxonomy('product', $id, 'a.featured=1', 5);
    foreach ($a_category_list as $k => $item) {
        $a_category_list[$k]['sub'] = $this->tax->get_taxonomy('product', $item['id'], null, 8);
        $a_category_list[$k]['products'] = $this->product->get_list(0, $item['id'], null, 8);
    }
    
    $this->smarty->assign('a_category_list', $a_category_list);
    $this->get_seo_metadata(@$category['name'], @$category['keyword'], @$category['description'], @$category['image']);
    $this->smarty->assign('category', $category);
    $this->smarty->display(LAYOUT_HOME);
}

function mainproduct()
{
    $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
    $category = $this->tax->get_value($id);
    $a_category_all = $this->tax->get_taxonomy('product', $id, null, null, 1, 1);
    $a_product = $this->product->get_list(0, $id, "a.ismain=1", 120, null, "a.views ASC");
    $where = "a.status=1 AND a.ismain=1 AND a.taxonomy_id IN (SELECT id FROM taxonomy WHERE type='product' AND (lft BETWEEN (SELECT lft FROM taxonomy WHERE id=$id) AND (SELECT rgt FROM taxonomy WHERE id=$id)) ORDER BY lft)";
    $all_product = $this->pdo->count_item('products', $where);
    $this->smarty->assign('a_product', $a_product);
    $this->smarty->assign('a_category_all', $a_category_all);
    $this->smarty->assign('category', $category);
    $this->smarty->assign('all_product', $all_product);
    $out = array();
    $out['id'] = $id;
    $this->smarty->assign('out', $out);
    $this->smarty->display(LAYOUT_DEFAULT);
}

function allcategory()
{
    $a_cate_number = @parse_ini_file(FILE_CATEGORY_NUMBER);
    $this->smarty->assign('a_cate_number', $a_cate_number);
    
    $a_category_all = $this->tax->get_taxonomy('product', 0, null, null, 1, 1);
    $this->smarty->assign('a_category_all', $a_category_all);
    
    $a_category_hot = $this->tax->get_taxonomy('product', 0, null, 11);
    $this->smarty->assign('a_category_hot', $a_category_hot);
    
    if (isset($_GET['build_cate_number'])) {
        $this->build_cate_number();
    }
    
    $this->smarty->display("category.tpl");
}

function build_cate_number($parent = 0)
{
    $a_sub = $this->pdo->fetch_all("SELECT a.taxonomy_id AS id,COUNT(1) AS number FROM products a
                WHERE a.status=1 AND a.taxonomy_id<>0
                GROUP BY a.taxonomy_id");
    
    $a_sub_0 = array();
    $a_sub_1 = array();
    $a_sub_2 = array();
    foreach ($a_sub as $item) {
        $a_sub_2[$item['id']] = $item['number'];
    }
    
    $a_category_all = $this->tax->get_taxonomy('product', 0, null, null, 1, 0);
    foreach ($a_category_all as $item) {
        $a_sub_0[$item['id']] = 0;
        foreach ($item['sub'] as $item1) {
            $a_sub_1[$item1['id']] = 0;
            foreach ($item1['sub'] as $item2) {
                $a_sub_0[$item['id']] += intval(@$a_sub_2[$item2['id']]);
                $a_sub_1[$item1['id']] += intval(@$a_sub_2[$item2['id']]);
            }
        }
    }
    
    $a_cate_number = $a_sub_0 + $a_sub_1 + $a_sub_2;
    
    file_put_contents(FILE_CATEGORY_NUMBER, lib_arr_to_ini($a_cate_number));
    
    lib_dump($a_cate_number);
    exit();
}

function detail()
{
    global $location;
    //$pid = isset($_GET['pid']) ? intval($_GET['pid']) : 0;
    $pid = isset($this->_get['id']) ? $this->_get['id'] : (isset($_GET['pid']) ? intval($_GET['pid']) : 0);
    $pid = explode("-", $pid);
    $pid = end($pid);
    $eventproduct_id = isset($_GET['eventproduct_id']) ? intval($_GET['eventproduct_id']) : 0;
    
    $info = $this->pdo->fetch_one("SELECT a.*,un.name AS unit,c.id AS tax_id,c.name AS category,
                (SELECT GROUP_CONCAT(CONCAT(version,':',price) separator ';') FROM productprices WHERE product_id=a.id) AS prices,
                (SELECT GROUP_CONCAT(CONCAT(meta_key,':',meta_value) separator ';') FROM productmetas WHERE product_id=a.id) AS metas
                FROM products a
                LEFT JOIN taxonomy c ON c.id=a.taxonomy_id
                LEFT JOIN taxonomy un ON un.id=a.unit_id
                WHERE a.id=$pid");
    $a_images = explode(";", @$info['images']);
    $this->smarty->assign('images_0', $a_images[0]);
    foreach ($a_images as $k => $item) {
        $a_images[$k] = $this->img->get_image($this->product->get_folder_img($pid), $item);
    }
    $info['avatar'] = @$a_images[0];
    $info['prices'] = $this->convert_value_concat($info['prices'], 'version', 'price');
    $this->aasort($info['prices'], 'price');
    $this->smarty->assign('swiftype_price',$info['prices'][0][price]);
    $info['metas'] = $this->convert_value_concat($info['metas'], 'meta_key', 'meta_value');
    // $info['metas'] = $this->pdo->fetch_all("SELECT meta_key,meta_value FROM productmetas WHERE product_id=$pid");
    // $info['prices'] = $this->pdo->fetch_all("SELECT version,price FROM productprices WHERE product_id=$pid ORDER BY price");
    
    
    if ($eventproduct_id != 0) {
        $epro = $this->pdo->fetch_one('SELECT price,promo FROM eventproducts WHERE id=' . $eventproduct_id);
        $info['prices'] = array();
        $info['prices'][0]['version'] = 'Giá khuyến mãi';
        $info['prices'][0]['price'] = $epro['promo'];
        $info['prices'][1]['version'] = 'Giá gốc';
        $info['prices'][1]['price'] = $epro['price'];
        $this->pdo->query('UPDATE eventproducts SET number_click=number_click+1 WHERE id=' . $eventproduct_id);
    }
    $info['a_images'] = $a_images;
    
    $info['order'] = count($info['prices']) == 0 ? 0 : 1;
    //         $info['unit'] = $info['unit'] == '' ? 'Piece' : $info['unit'];
    //         $info['description'] = str_replace("beta.daisan.vn", "daisan.vn", $info['description']);
    $price = "Liên hệ";
    if (count($info['prices']) == 1) {
        $price = "VN " . number_format($info['prices'][0]['price']) . "Đ";
    } elseif (count($info['prices']) > 1) {
        $a_price = array();
        foreach ($info['prices'] as $item) {
            $a_price[] = $item['price'];
        }
        sort($a_price);
        $a_price = array_values($a_price);
        
        $price = "VN " . number_format($a_price[0]) . "Đ";
        $price .= " - " . number_format($a_price[count($a_price) - 1]) . "Ä‘";
    }
    $info['price'] = $price;
    
    $other = $this->product->get_list(0, @$info['taxonomy_id'], "a.id<>$pid AND a.page_id=".$info['page_id'], 10);
    $this->smarty->assign('other', $other);
    
    $page = $this->page->get_profile(@$info['page_id']);
    if($this->arg['isadmin']==1 || ($page['isphone']==1))
        $page['phone'] = $this->option['contact']['phone'];
        $this->smarty->assign('page', $page);
        //         $this->smarty->assign('info_page_location',$this->page->info_page_location(@$info['page_id'],$location));
        //         $page_id = @$page['pid'];
        //         $sql = "SELECT a.id,a.name FROM taxonomy a
        //                 WHERE a.id IN (SELECT b.taxonomy_id FROM products b WHERE b.status=1 AND b.page_id=$page_id)";
        //         $category = $this->pdo->fetch_all($sql);
        //         foreach ($category as $k => $item) {
        //             $category[$k]['url'] = $this->page_url . $this->sour . "&site=product_list&cid=" . $item['id'] . "&pn=" . $this->str->str_convert($item['name']);
            //         }
            //         $this->smarty->assign('category', $category);
            //         $info['url_contact'] = DOMAIN . "?mod=page&site=contact&page_id=" . @$info['page_id'] . "&product_id=" . $pid;
            $info['url_addcart'] = DOMAIN . "?mod=product&site=addcart&pid=$pid";
            if ($eventproduct_id != 0)
                $info['url_addcart'] .= "&eventproduct_id=" . $eventproduct_id;
                $this->smarty->assign('info', $info);
                
                //         if (isset($_COOKIE['HodineCache']))
                //             $HodineCache = json_decode($_COOKIE['HodineCache'], true);
                //         else
                //             $HodineCache = array();
                //         if (! isset($HodineCache['product_view']) || ! is_array($HodineCache['product_view']))
                //             $HodineCache['product_view'] = array();
                //         array_unshift($HodineCache['product_view'], $pid);
                //         $HodineCache['product_view'] = array_unique($HodineCache['product_view']);
                //         setcookie('HodineCache', json_encode($HodineCache), time() + (86400 * 30 * 30), "/");
                
                //$HodineCache['product_view'][] = 0;
                //$a_product_views = $this->product->get_list_inarray($HodineCache['product_view']);
                //$this->smarty->assign('a_product_views', $a_product_views);
                
                //         $this->set_useronline($info['page_id']);
                
                //         $out = array();
                
                //         $keywords = $this->product->get_product_keyword("id IN (" . ($info['keyword'] == null ? 0 : $info['keyword']) . ")");
                //         $this->smarty->assign('keywords', $keywords);
                //         $meta_key = array();
                //         foreach ($keywords as $item) {
                //             $meta_key[] = $item['name'];
                    //         }
                    //         $out['meta_key'] = implode(",", $meta_key);
                    
                    //         $stat_access = $this->pdo->fetch_one("SELECT COUNT(1) AS number FROM useronlines
                    //                 WHERE page_id= $page_id AND DATE_FORMAT(date_log, '%Y')='" . date("Y") . "'");
                    //         $out['access_month'] = $stat_access['number'];
                //         $out['product_unit'] = $this->tax->get_select_taxonomy('product_unit', @$info['unit_id'], 0, null, 0);
                
                //         $out['number_othersell'] = $this->pdo->count_item('products', "a.code='" . $info['code'] . "' AND a.id<>$pid");
                //         $out['number_productfavorite'] = $this->pdo->count_item('productfavorites', "a.product_id=" . $info['id']);
                //         $out['number_productsale'] = $this->pdo->count_item('productorderitems', "a.product_id=" . $info['id']);
                
                $out['role_edit'] = 0;
                if ($this->arg['isadmin'] == 1)
                    $out['role_edit'] = 1;
                    $this->smarty->assign('out', $out);
                    $this->get_seo_metadata(@$info['name'], @$out['meta_key'], @$info['name'], @$info['avatar']);
                    $this->get_breadcrumb(@$info['taxonomy_id']);
                    $a_cate_number = @parse_ini_file(FILE_CATEGORY_NUMBER);
                    $this->smarty->assign('a_cate_number', $a_cate_number);
                    $this->pdo->query("UPDATE products SET views=views+1 WHERE id=$pid");
                    $this->smarty->display('detail.tpl');
}

function aasort(&$array, $key)
{
    $sorter = array();
    $ret = array();
    reset($array);
    foreach ($array as $ii => $va) {
        $sorter[$ii] = $va[$key];
    }
    asort($sorter);
    foreach ($sorter as $ii => $va) {
        $ret[$ii] = $array[$ii];
    }
    $array = $ret;
}

function convert_value_concat($str, $field1 = 'key', $field2 = 'value')
{
    $ex_str = explode(';', $str);
    $a_str = array();
    foreach ($ex_str as $k => $item) {
        $a_item = explode(':', $item);
        if (count($a_item) == 2) {
            $a_str[$k][$field1] = $a_item[0];
            $a_str[$k][$field2] = $a_item[1];
        }
    }
    return $a_str;
}

function load_prices()
{
    $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
    if ($id != 0) {
        $prices = $this->pdo->fetch_all('SELECT version,price FROM productprices WHERE product_id=' . $id);
        
        $_SESSION['Product_prices'] = array();
        foreach ($prices as $k => $item) {
            $_SESSION['Product_prices'][$k]['key'] = $item['version'];
            $_SESSION['Product_prices'][$k]['value'] = number_format($item['price']);
        }
    } else {
        $_SESSION['Product_prices'] = isset($_SESSION['Product_prices']) ? $_SESSION['Product_prices'] : array();
    }
    
    $out = array();
    $out['number'] = count($_SESSION['Product_prices']);
    $this->smarty->assign('result', $_SESSION['Product_prices']);
    $this->smarty->assign('out', $out);
    $this->smarty->display(LAYOUT_NONE);
}

function set_useronline($page_id)
{
    global $login;
    $step_time = time() - 30 * 60;
    $ip = $_SERVER['REMOTE_ADDR'];
    $date = date("Y-m-d");
    $online = $this->pdo->check_exist("SELECT updated,number FROM useronlines
    			WHERE user_id=$login AND date_log='$date' AND user_ip='$ip' AND page_id=$page_id");
    $data['updated'] = time();
    if (! $online) {
        $data['page_id'] = $page_id;
        $data['user_id'] = $login;
        $data['user_ip'] = $ip;
        $data['date_log'] = $date;
        $data['number'] = 1;
        $this->pdo->insert('useronlines', $data);
    } elseif ($online && $online['updated'] < $step_time) {
        $data['number'] = $online['number'] + 1;
        $this->pdo->update('useronlines', $data, "user_id=$login AND date_log='$date' AND user_ip='$ip' AND page_id=$page_id");
    } else {
        $this->pdo->update('useronlines', $data, "user_id=$login AND date_log='$date' AND user_ip='$ip' AND page_id=$page_id");
    }
}

function ajax_handle_price()
{
    $rt = array();
    if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'add_price') {
        $Product_prices = isset($_SESSION['Product_prices']) ? $_SESSION['Product_prices'] : array();
        $number = count($Product_prices);
        $rt['code'] = 1;
        if ($number > 5) {
            $rt['code'] = 0;
            $rt['msg'] = "Báº¡n chá»‰ Ä‘Æ°á»£c phÃ©p Ä‘Æ°a tá»‘i Ä‘a 6 ná»™i dung.";
        } else {
            $_SESSION['Product_prices'][$number + 1]['key'] = "";
            $_SESSION['Product_prices'][$number + 1]['value'] = "";
        }
        echo json_encode($rt);
        exit();
    } else if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'set_price') {
        $_SESSION['Product_prices'][$_POST['id']][$_POST['type']] = trim($_POST['value']);
        exit();
    } else if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'delete_price') {
        unset($_SESSION['Product_prices'][$_POST['id']]);
        exit();
    } else if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'sort_price') {
        $id = isset($_POST['id']) ? intval($_POST['id']) : - 1;
        $type = isset($_POST['type']) ? trim($_POST['type']) : 'up';
        $me = $_SESSION['Product_prices'][$id];
        if ($type == 'up') {
            $up = $_SESSION['Product_prices'][$id - 1];
            $_SESSION['Product_prices'][$id - 1] = $me;
            $_SESSION['Product_prices'][$id] = $up;
        } else {
            $up = $_SESSION['Product_prices'][$id + 1];
            $_SESSION['Product_prices'][$id + 1] = $me;
            $_SESSION['Product_prices'][$id] = $up;
        }
    } else if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'save_price') {
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        $Product_prices = isset($_SESSION['Product_prices']) ? $_SESSION['Product_prices'] : array();
        $this->pdo->query("DELETE FROM productprices WHERE product_id=$id");
        foreach ($Product_prices as $item) {
            if (trim($item['key']) != null && trim($item['value']) != null) {
                $data = array();
                $data['version'] = $item['key'];
                $data['price'] = $this->str->convert_money_to_int($item['value']);
                $data['product_id'] = $id;
                $this->pdo->insert('productprices', $data);
                unset($data);
            }
        }
        unset($_SESSION['Product_prices']);
    }
}

function adsclick()
{
    global $login;
    $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
    $product = $this->pdo->fetch_one("SELECT p.id,p.name,p.page_id,a.campaign_id,a.id AS adsproduct_id,a.score
                FROM adsproducts a
                LEFT JOIN adscampaign b ON a.campaign_id=b.id
                LEFT JOIN products p ON a.product_id=p.id
                WHERE a.product_id=$id AND b.status=1 AND a.status=1");
    
    if ($product) {
        $data = array();
        $data['page_id'] = $product['page_id'];
        $data['campaign_id'] = $product['campaign_id'];
        $data['product_id'] = $product['id'];
        $data['score'] = $product['score'];
        $data['user_ip'] = getenv('HTTP_CLIENT_IP') ?: getenv('HTTP_X_FORWARDED_FOR') ?: getenv('HTTP_X_FORWARDED') ?: getenv('HTTP_FORWARDED_FOR') ?: getenv('HTTP_FORWARDED') ?: getenv('REMOTE_ADDR');
        $data['user_id'] = $login;
        $data['date_click'] = date('Y-m-d');
        $data['created'] = time();
        $this->pdo->insert('adsclicks', $data);
        unset($data);
        $this->pdo->query('UPDATE adsproducts SET number_click=number_click+1 WHERE id=' . $product['adsproduct_id']);
        $url = $this->product->get_url($product['id'], $product['name']);
        lib_redirect($url);
    } else {}
}

function addcart()
{
    $pid = isset($_GET['pid']) ? intval($_GET['pid']) : 0;
    $eventproduct_id = isset($_GET['eventproduct_id']) ? intval($_GET['eventproduct_id']) : 0;
    $info = $this->pdo->fetch_one("SELECT a.id,a.name,a.minorder,a.images,a.page_id,b.name AS page_name,
    			(SELECT p.price FROM productprices p WHERE p.product_id=a.id ORDER BY p.price ASC LIMIT 1) AS price
    			FROM products a LEFT JOIN pages b ON b.id=a.page_id
    			WHERE a.id=$pid");
    if (! $info)
        lib_redirect(DOMAIN);
        $a_image = explode(";", $info['images']);
        $info['avatar'] = $this->img->get_image($this->product->get_folder_img($pid), $a_image[0]);
        $info['url'] = $this->product->get_url($pid, $info['name']);
        $page_id = $info['page_id'];
        // var_dump($info);
        $_SESSION[SESSION_PRODUCTCART] = isset($_SESSION[SESSION_PRODUCTCART]) ? $_SESSION[SESSION_PRODUCTCART] : array();
        if (! isset($_SESSION[SESSION_PRODUCTCART][$page_id])) {
            $_SESSION[SESSION_PRODUCTCART][$page_id] = array();
            $_SESSION[SESSION_PRODUCTCART][$page_id]['pagename'] = $info['page_name'];
            $_SESSION[SESSION_PRODUCTCART][$page_id]['products'] = array();
        }
        
        $_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$pid]['id'] = $info['id'];
        $_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$pid]['name'] = $info['name'];
        $_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$pid]['avatar'] = $info['avatar'];
        $_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$pid]['url'] = $info['url'];
        $_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$pid]['price'] = $info['price'];
        $_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$pid]['number'] = $info['minorder'] == 0 ? 1 : $info['minorder'];
        if ($eventproduct_id != 0) {
            $epro = $this->pdo->fetch_one('SELECT price,promo FROM eventproducts WHERE id=' . $eventproduct_id);
            $_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$pid]['price'] = $epro['promo'];
        }
        lib_redirect("?mod=product&site=cart");
}

function cart()
{
    global $login;
    $cart = isset($_SESSION[SESSION_PRODUCTCART]) ? $_SESSION[SESSION_PRODUCTCART] : array();
    $out['number'] = 0;
    $out['total'] = 0;
    
    foreach ($cart as $k => $page) {
        $total = 0;
        foreach ($page['products'] as $k1 => $item) {
            $total += $item['price'] * $item['number'];
            $out['total'] += $item['price'] * $item['number'];
            $out['number'] += 1;
        }
        $cart[$k]['total'] = $total;
    }
    
    $this->smarty->assign('cart', $cart);
    $this->smarty->assign("out", $out);
    $this->smarty->display(LAYOUT_DEFAULT);
}

function payment()
{
    global $login;
    $cart = isset($_SESSION[SESSION_PRODUCTCART]) ? $_SESSION[SESSION_PRODUCTCART] : array();
    $out['number'] = 0;
    $out['total'] = 0;
    if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'payment') {
        $data['customer'] = trim(@$_POST['name']);
        $data['phone'] = trim(@$_POST['phone']);
        $data['email'] = trim(@$_POST['email']);
        $data['address'] = trim(@$_POST['address']);
        $data['description'] = trim(@$_POST['description']);
        $data['user_id'] = $login;
        $data['created'] = time();
        $data['updated'] = time();
        foreach ($cart as $page_id => $page) {
            $data['page_id'] = $page_id;
            if ($order_id = $this->pdo->insert('productorders', $data)) {
                foreach ($page['products'] as $k => $item) {
                    $order['order_id'] = $order_id;
                    $order['page_id'] = $page_id;
                    $order['product_id'] = $k;
                    $order['number'] = $item['number'];
                    $order['price'] = $item['price'];
                    $this->pdo->insert('productorderitems', $order);
                    unset($order);
                    $product['inventory'] = ($item['inventory'] - $item['number']);
                    $this->pdo->update('products', $product, "id=$k AND page_id=$page_id");
                    unset($product);
                }
                // Gá»­i email
                $page = $this->pdo->fetch_one("SELECT id,name,email FROM pages WHERE id=$page_id");
                $a_mail_bcc = array(
                    'nhamphongdaijsc@gmail.com',
                    'info@daisan.vn',
                );
                $a_mail_bcc[] = $page['email'];
                $ordercode = "#OID" . $page['id'] . $order_id;
                $mail_title = "Đơn hàng mới $ordercode";
                $mail_to = array(
                    'TO' => array(
                        'admin@daisan.vn'
                    ),
                    'CC' => array(
                        'chungit.dsc@daisan.vn'
                    ),
                    'BCC' => $a_mail_bcc
                );
                $mail_content = file_get_contents(DOMAIN . '?mod=product&site=set_mail_content_cart&id=' . $page_id . '&order_id=' . $order_id);
                send_mail($mail_to, "DAISAN", $mail_title, $mail_content);
                // #End Gá»­i email
            }
        }
        
        $_SESSION[SESSION_PRODUCTCART] = array();
        exit();
    }
    foreach ($cart as $page_id => $page) {}
    foreach ($_SESSION[SESSION_PRODUCTCART] as $k => $page) {
        $total = 0;
        foreach ($page['products'] as $k1 => $item) {
            $total += $item['price'] * $item['number'];
            $out['total'] += $item['price'] * $item['number'];
            $out['number'] += 1;
        }
        $cart[$k]['total'] = $total;
    }
    
    $this->smarty->assign('cart', $cart);
    $this->smarty->assign("out", $out);
    $this->smarty->display(LAYOUT_DEFAULT);
}

function set_mail_content_cart()
{
    $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
    $order_id = isset($_GET['order_id']) ? intval($_GET['order_id']) : 0;
    $page = $this->pdo->fetch_one("SELECT a.id,a.name,a.phone,a.email FROM pages a
                WHERE a.id=$id");
    $page['token'] = md5($page['email'] . time());
    $page['url'] = URL_PAGEADMIN . '?mod=order&site=index&token=' . $page['token'];
    $page['codeorder'] = "#OID" . $page['id'] . $order_id;
    $this->smarty->assign('data', $page);
    $where = "a.order_id=$order_id AND a.page_id=$id";
    $detail = $this->pdo->fetch_all("SELECT a.price,a.number,b.name AS productname
                FROM productorderitems a LEFT JOIN products b ON b.id=a.product_id
                WHERE $where");
    $this->smarty->assign('detail', $detail);
    $this->smarty->display(LAYOUT_NONE);
}

function ajax_loadmore_product()
{
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
    $limit = 40;
    $page = isset($_POST['page']) ? trim($_POST['page']) : 1;
    $start = ($page - 1) * $limit;
    $a_product = $this->product->get_list(0, $id, "a.ismain=1", "$start,$limit");
    $this->smarty->assign('a_product', $a_product);
    $this->smarty->display(LAYOUT_NONE);
}

function ajax_handle()
{
    global $login;
    $data = array();
    $rt = array();
    if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'cart_add_product') {
        $_SESSION['vsc_session_shop_cart']['product_id'] = intval(@$_POST['id']);
        $_SESSION['vsc_session_shop_cart']['number'] = intval(@$_POST['number']);
        exit();
    } elseif (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'delete_cart') {
        $_SESSION[SESSION_PRODUCTCART] = array();
        exit();
    } elseif (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'delete_product') {
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        $page_id = isset($_POST['page_id']) ? intval($_POST['page_id']) : 0;
        
        unset($_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$id]);
        exit();
    } elseif (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'change_number_product') {
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        $page_id = isset($_POST['page_id']) ? intval($_POST['page_id']) : 0;
        $number = isset($_POST['number']) ? intval($_POST['number']) : 0;
        
        $_SESSION[SESSION_PRODUCTCART][$page_id]['products'][$id]['number'] = $number;
        exit();
    } elseif (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'set_product_favorite') {
        $id = intval(@$_POST['id']);
        if ($this->pdo->check_exist("SELECT 1 FROM productfavorites WHERE user_id=$login AND product_id=$id")) {
            $rt['code'] = 0;
            $rt['msg'] = 'Bạn đã thêm vào danh sách theo dõi.';
        } else {
            $data['user_id'] = $login;
            $data['product_id'] = $id;
            $data['created'] = time();
            $data['status'] = 1;
            $this->pdo->insert('productfavorites', $data);
            $rt['code'] = 1;
            $rt['msg'] = 'Lưu vào danh sách theo dõi thành công.';
        }
        echo json_encode($rt);
        exit();
    } elseif (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'remove_product_favorite') {
        $id = intval(@$_POST['id']);
        $data['created'] = time();
        $data['status'] = 0;
        $this->pdo->update('productfavorites', $data, "product_id=$id AND user_id=$login");
        exit();
    }
}
}