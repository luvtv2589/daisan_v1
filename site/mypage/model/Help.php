<?php

class Help extends Pageadmin{

	function ajax_set_language_used(){
		if(isset($_POST['lang'])){
			$_SESSION[SESSION_LANGUAGE_DEFAULT] = $_POST['lang'];
			exit();
		}
	}
	

	function ajax_load_location(){
		$Type = isset($_POST['Type']) ? trim($_POST['Type']) : null;
		$Value = isset($_POST['Value']) ? intval($_POST['Value']) : 0;
		$prefix = "Chọn quận huyện";
		if($Type=='wards') $prefix = "Chọn phường xã";
		$str = $this->help->get_select_location(0, $Value, $prefix);
		echo $str; exit();
	}
	
	
	function ajax_active_item() {
		if (isset($_POST['id'])) {
			$sql = "SHOW COLUMNS FROM ".$_POST['table'];
			$stmt = $this->pdo->conn->prepare($sql);
			$stmt->execute();
			$fieldid = $stmt->fetch(PDO::FETCH_COLUMN);
	
			$fieldstatus = "Status";
			if(!$this->pdo->check_exist("SELECT $fieldstatus FROM ".$_POST['table']." LIMIT 1")){
				$fieldstatus = "status";
			}
			$value = $this->pdo->fetch_one("SELECT $fieldstatus FROM ".$_POST['table']." WHERE $fieldid=".$_POST['id']);
			$status = 0;
			if(@$value[$fieldstatus]==0) $status = 1;
	
			$this->pdo->query("UPDATE ".$_POST['table']." SET $fieldstatus=$status WHERE $fieldid=".$_POST['id']);
			echo $this->get_status_btn($status, $_POST['table'], $_POST['id']);
			exit();
		}
		echo 0; exit();
	}

	
	function ajax_delete_item() {
		$rt['code'] = 0;
		if (isset($_POST['id'])) {
			$sql = "SHOW COLUMNS FROM ".$_POST['table'];
			$stmt = $this->pdo->conn->prepare($sql);
			$stmt->execute();
			$fieldid = $stmt->fetch(PDO::FETCH_COLUMN);
			$this->pdo->query("DELETE FROM ".$_POST['table']." WHERE $fieldid=".$_POST['id']);
			$rt['code'] = 1;
		}
		echo json_encode($rt); exit();
	}
	
}
