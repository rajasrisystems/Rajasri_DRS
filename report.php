<?php 
	include 'includes/common.php';
	include_once "includes/classes/class.index.php";
	$objLogin = new Login();
	$objLogin->chklogin();
	$resourcevar = "SELECT * FROM resource";
	$resresult = mysql_query($resourcevar) OR die(mysql_error());
	while($resrow = mysql_fetch_assoc($resresult))
		{
			$resdata[] = $resrow; // store in array	
		}
	$objSmarty->assign('resdata', $resdata);	
	//$objReport = new Login();
	//$objReport->rptpage();
	$objSmarty->assign('activePage',"3");
	$objSmarty->assign('IncludeTpl',"report.tpl");
	$objSmarty->display("pagetemplate.tpl");
?>



