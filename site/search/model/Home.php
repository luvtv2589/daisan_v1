<?php

class Home extends Main {
    private $folder, $pament_method;
    function __construct() {
        parent::__construct ();
    }
    
    function index() {
        $this->smarty->display(LAYOUT_HOME);
    }
}