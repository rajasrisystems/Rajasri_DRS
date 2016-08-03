<?php 
	include 'includes/common.php';
	include_once "includes/classes/class.admin.php";
	$objAdmin = new Admin();
	if(isset($_REQUEST['hdAction']) && $_REQUEST['hdAction']!='')
	{
		$objAdmin -> Admin_newuser();
	}
	$objSmarty->assign('objReport',$objAdmin);
	$objSmarty->assign('activePage',"5");
	$objSmarty->assign('IncludeTpl',"admin.tpl");
	$objSmarty->display("pagetemplate.tpl");
?>