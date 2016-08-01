<?php 
	include 'includes/common.php';
	include_once $config['SiteClassPath']."class.index.php";
	$objLogin = new Login();
	if($_REQUEST['hdAction']=="1")
	{
		$objLogin->MakeLoginusers();
	}
	$objSmarty->assign('IncludeTpl',"index.tpl");
	$objSmarty->display("index.tpl");
?>
