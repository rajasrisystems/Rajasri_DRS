<?php 
	include 'includes/common.php';
	include_once "includes/classes/class.index.php";
	include_once "includes/classes/class.report.php";
	$objLogin = new Login();
	
	$objLogin->chklogin();
	$objReport = new Report();
	$objReport->getAllResources();
	$objReport->getAllRating();
	//$objReport->slctdisp();
	$objSmarty->assign('objReport',$objReport);
	$objSmarty->assign('activePage',"3");
	$objSmarty->assign('IncludeTpl',"report.tpl");
	$objSmarty->display("pagetemplate.tpl");
?>



