<?php 
	include 'includes/common.php';
	include_once "includes/classes/class.index.php";
	$objLogin = new Login();
	$objLogin->chklogin();
	$objSmarty->assign('activePage',"2");
	if($_REQUEST['Hitaction']=='1')
	{
		$objLogin->insertdetails();
	}
	if($_REQUEST['update_rating']=='1')
	{
		$objLogin->Update_rating($_REQUEST['Rat_Id']);
	}
	if($_REQUEST['Rat_Id']!='')
	{
		$objLogin->get_RatingID($_REQUEST['Rat_Id']);
	}
	$objLogin->display();
	$disvar = "SELECT * FROM resource";
	$result = mysql_query($disvar) OR die(mysql_error());
	while($row = mysql_fetch_assoc($result))
		{
			$data[] = $row; // store in array	
		}
	$objSmarty->assign('data', $data);	
	$objSmarty->assign('IncludeTpl',"rating.tpl");
	$objSmarty->display("pagetemplate.tpl");
	
?>



