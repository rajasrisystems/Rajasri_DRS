<?php
	include 'includes/common.php';
	include_once "includes/classes/class.resource.php";
	$objResource = new Resource();
	
	if(isset($_REQUEST['hdAction']) && $_REQUEST['hdAction']!='')
	{
		$objResource -> ResourceAdding();
	}
	if($_REQUEST['Admin_updateuser']=='1')
	{
		$objResource->Admin_updateuser($_REQUEST['adminId']);
	}
	if($_REQUEST['Rs_Id']!='')
	{
		$objResource->getResourcebyId($_REQUEST['Rs_Id']);
	}
	$objResource->show_resource();
	$objSmarty->assign('objReport',$objResource);
	$objSmarty->assign('activePage',"4");
	$objSmarty->assign('IncludeTpl',"resource.tpl");
	$objSmarty->display("pagetemplate.tpl");
?>