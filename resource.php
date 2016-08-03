<?php
	include 'includes/common.php';
	include_once "includes/classes/class.resource.php";
	$objResource = new Resource();
	
	if(isset($_REQUEST['hdAction']) && $_REQUEST['hdAction']!='')
	{
		$objResource -> ResourceAdding();
	}
	
	
	
	$objSmarty->assign('objReport',$objResource);
	$objSmarty->assign('activePage',"4");
	$objSmarty->assign('IncludeTpl',"resource.tpl");
	$objSmarty->display("pagetemplate.tpl");
?>