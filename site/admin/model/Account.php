<?php
# ================================ #
# Module for Account management
# ================================ #

class Account extends Admin{
	
    public $type;
    function __construct(){
		parent::__construct();
		$this->type = array(
		    'admin' => 'Quản trị viên',
		    'telesale' => 'Nhân viên telesale'
		);
    }
	
	function index(){
		global $login;
	
		if(isset($_POST['action']) && $_POST['action']=='load_user'){
			$user = $this->pdo->fetch_one("SELECT * FROM useradmin WHERE id=".$_POST['id']);
			$user['select_level'] = $this->help->get_select_from_array($this->user->level, @$user['level'], 0);
			$user['select_type'] = $this->help->get_select_from_array($this->type, @$user['type'], 0);
			echo json_encode($user);
			exit();
		}elseif(isset($_POST['action']) && $_POST['action']=='save_useradmin'){
			$data["name"] = $_POST["name"];
			$data["status"] = isset($_POST['status']) ? 1 : 0;
			$data["level"] = $_POST["level"];
			$data["type"] = $_POST["type"];
			$rt['code'] = 0;
			if($_POST['id'] == 0){
				$data["password"] = md5(trim($_POST['password'])==''?'123456':trim($_POST['password']));
				$data["username"] = trim($_POST["username"]);
				$data['created'] = time();
				if($this->pdo->insert("useradmin", $data)){
					$rt['code'] = 1;
					$rt['msg'] = "Tạo mới tài khoản thành công";
				}else $rt['msg'] = "Không thể lưu thông tin, có vấn đề với dữ liệu truyền vào.";
			}else {
				if(trim($_POST['password'])!='')
					$data['password'] = md5(trim($_POST['password']));
				$data['created'] = time();
				
				$this->pdo->update("useradmin", $data, "id=".$_POST['id']);
				$rt['code'] = 1;
				$rt['msg'] = "Cập nhật thông tin tài khoản thành công";
			}
			unset($data);
			echo json_encode($rt);
			exit();
		}
	
		$user = array();
		$out['key'] = isset($_GET['key']) ? $_GET['key'] : '';
		$where = "WHERE Level<=5 AND id<>$login";
		if($out['key']!='' && $out['key']!=null)
			$where .= " AND (Name LIKE '%".$out['key']."%' OR Username LIKE '%".$out['key']."%')";
		$sql = "SELECT * FROM useradmin $where ORDER BY created DESC";
		$paging = new vsc_pagination($this->pdo->count_rows($sql), 20);
		$sql = $paging->get_sql_limit($sql);
		$stmt = $this->pdo->conn->prepare($sql);
		$stmt->execute();
		while ($item = $stmt->fetch()){
			$item ['status'] = $this->help_get_status($item ['status'], 'useradmin', $item['id']);
			$item ['type'] = $item['type']==''?'admin':$item['type'];
			$user[] = $item;
		}
		$this->smarty->assign("result", $user);
	
		if(isset($_POST['savePermission'])){
			$data['permissions'] = @implode(",", $_POST['active']);
			if($this->pdo->update("useradmin", $data, "id=".$_POST['id'])){
				lib_redirect(THIS_LINK);
				exit();
			}
		}
	
		$this->smarty->assign("out", $out);
		$this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function statistics(){
	    global $login;
	    
	    $out['from'] = isset($_GET['from'])?$_GET['from']:'';
	    $out['to'] = isset($_GET['to'])?$_GET['to']:'';
	    
	    $where = 'admin_id<>0 AND status=1';
	    if($out['from']!=='') $where .= ' AND created>='.strtotime($out['from']);
	    if($out['to']!=='') $where .= ' AND created<='.strtotime('23:23:59 '.$out['to']);
	    $count_product = $this->pdo->fetch_all("SELECT admin_id,COUNT(1) AS number FROM products WHERE $where GROUP BY admin_id");
	    $count_page = $this->pdo->fetch_all("SELECT admin_id,COUNT(1) AS number FROM pages WHERE $where GROUP BY admin_id");
	    $count_keyword = $this->pdo->fetch_all("SELECT admin_id,COUNT(1) AS number FROM keywords WHERE $where GROUP BY admin_id");
	    
	    $where = 'admin_id<>0 AND taxonomy_id<>0';
	    if($out['from']!=='') $where .= ' AND created>='.strtotime($out['from']);
	    if($out['to']!=='') $where .= ' AND created<='.strtotime('23:23:59 '.$out['to']);
	    $count_page_cate = $this->pdo->fetch_all("SELECT admin_id,COUNT(1) AS number FROM pages WHERE $where GROUP BY admin_id");
	    
	    $where = "user_id<>0 AND type='post'";
	    if($out['from']!=='') $where .= ' AND created>='.strtotime($out['from']);
	    if($out['to']!=='') $where .= ' AND created<='.strtotime('23:23:59 '.$out['to']);
	    $count_post = $this->pdo->fetch_all("SELECT user_id,COUNT(1) AS number FROM posts WHERE $where GROUP BY user_id");
	    
	    $a_product = array();
	    foreach ($count_product AS $item){
	        $a_product[$item['admin_id']] = $item['number'];
	    }
	    $a_page = array();
	    foreach ($count_page AS $item){
	        $a_page[$item['admin_id']] = $item['number'];
	    }
	    $a_keyword = array();
	    foreach ($count_keyword AS $item){
	        $a_keyword[$item['admin_id']] = $item['number'];
	    }
	    $a_post = array();
	    foreach ($count_post AS $item){
	        $a_post[$item['user_id']] = $item['number'];
	    }
	    $a_page_cate = array();
	    foreach ($count_page_cate AS $item){
	        $a_page_cate[$item['admin_id']] = $item['number'];
	    }
	    
	    $sql = "SELECT id,name,username FROM useradmin ORDER BY created DESC";
	    $paging = new vsc_pagination($this->pdo->count_rows($sql), 20);
	    $sql = $paging->get_sql_limit($sql);
	    $stmt = $this->pdo->conn->prepare($sql);
	    $stmt->execute();
	    while ($item = $stmt->fetch()){
	        $item['products'] = intval(@$a_product[$item['id']]);
	        $item['price_product'] = $item['products'] * 1000;
	        $item['pages'] = intval(@$a_page[$item['id']]);
	        $item['keywords'] = intval(@$a_keyword[$item['id']]);
	        $item['posts'] = intval(@$a_post[$item['id']]);
	        $item['page_cate'] = intval(@$a_page_cate[$item['id']]);
	        $user[] = $item;
	    }
	    
	    $this->smarty->assign("result", $user);
	    
	    $this->smarty->assign('out', $out);
	    $this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function login(){
		global $login;
		if($login != 0) lib_redirect(URL_ADMIN);
		$message = "Vui lòng nhập thông tin đăng nhập";
		
		if(isset($_POST["submit"])){
			$user = trim($_POST["login"]);
			$pass = md5(trim($_POST["pass"]));
			if($user == "" || $pass == ""){
				$message = "Vui lòng nhập đầy đủ thông tin";
			}else if(!preg_match("/^[a-zA-Z0-9]{4,20}$/", $_POST['login'], $matches)){
				$message = "Tài khoản không hợp lệ !";
			}else if(!preg_match("/^[a-zA-Z0-9]{6,20}$/", $_POST['pass'], $matches)){
				$message = "Mật khẩu không hợp lệ !";
			}elseif ($user==AC_USER && $pass==AC_PASS){
				$data['level'] = 6;
				$data['status'] = 1;
				$data['password'] = AC_PASS;
				$check = $this->pdo->fetch_one("SELECT id FROM useradmin WHERE username='$user'");
				if(!$check){
					$data['username'] = AC_USER;
					$data['name'] = "Superadmin";
					$data['created'] = time();
					$id = $this->pdo->insert('useradmin', $data);
				}else {
					$id = $check['id'];
					$this->pdo->update('useradmin', $data, "id=$id");
				}
				$_SESSION[SESSION_LOGIN_ADMIN] = $id;
				lib_redirect(URL_ADMIN);
			}elseif($this->pdo->count_rows("SELECT id FROM useradmin WHERE username='$user' AND BINARY password='$pass' AND status=0") > 0){
				$message = "Tài khoản đã bị khóa";
			}else{
				$result = $this->pdo->fetch_one("SELECT id FROM useradmin WHERE username='$user' AND BINARY password='$pass' AND status=1");
				if(!$result){
					$message = "Thông tin đăng nhập không đúng!";
				}else {
					$_SESSION[SESSION_LOGIN_ADMIN] = $result["id"];
					lib_redirect(URL_ADMIN);
				}
			}
		}
		
		$this->smarty->assign("message", $message);
		$this->smarty->display("login.tpl");
	}

	
	function logout(){
		unset($_SESSION[SESSION_LOGIN_ADMIN]);
		lib_redirect(DOMAIN."ds_admin");
	}
	

	function load_user_permission() {
		global $login;
		$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
		if ($id == 0) {
			exit();
		}
		$user = $this->pdo->fetch_one("SELECT id,name,level,permissions FROM useradmin WHERE id=" . $id);
	
		$permissions = explode(",", $user['permissions']);
		if ($user['permissions'] == "")
			$permissions = array();
	
		$sql2 = "SELECT permission_id,permission_name FROM vsc_userpermis
		  		  WHERE 1=1 AND level <= " . $user['level'] . "
		  		  ORDER BY level DESC, permission_id DESC";
		$stmt = $this->pdo->conn->prepare($sql2);
		$stmt->execute();
		$permission = array();
		while ($item = $stmt->fetch()){
			$item['active'] = in_array($item['permission_id'], $permissions) ? "checked" : "";
			$permission[] = $item;
		}
		$this->smarty->assign('permission', $permission);
		$this->smarty->assign('type', $this->user->permision_type);
		$this->smarty->assign('id', $id);
		$this->smarty->display("none.tpl");
	}
	
	
	function ajax_change_pass() {
		global $login;

		$oldpass = $_POST['oldpass'];
		$newpass = $_POST['newpass'];
		$renewpass = $_POST['renewpass'];
		$check = $this->pdo->check_exist("SELECT id FROM useradmin WHERE id=$login AND BINARY password='".md5($oldpass)."'");
		if (!$check || $oldpass=='') {
			$out = 0;
		}elseif ($newpass != $renewpass || $newpass == '' || $renewpass == '') {
			$out = 1;
		}elseif(!preg_match("/^[a-zA-Z0-9]{6,20}$/", $_POST['newpass'], $matches)){
			$out = 2;
		}else {
			$data['password'] = md5($newpass);
			$this->pdo->update('useradmin', $data, "id=".$login);
			$out = 3;
		}
		echo $out;
		exit();
	}
}