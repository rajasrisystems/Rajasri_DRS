<?php
class Login extends MysqlFns
{

	function Login()
		{
		global $config;
        	$this->MysqlFns();
		$this->Offset			= 0;
		$this->Limit			= 15;
		$this->page			= 0;
		$this->Keyword			= '';
		$this->Operator			= '';
		$this->PerPage			= '';
		}	
		
	function MakeLoginusers()
	{
		global $objSmarty;
		$sql = "SELECT * FROM `admin`"." WHERE `Username`='".addslashes($_REQUEST['username'])."' AND `Password`='".addslashes($_REQUEST['password'])."'";
		$sle = $this->ExecuteQuery($sql, "select");
		$Count = $this->ExecuteQuery($sql, "norows");
		if($Count > 0)
		{
			session_start();
			$_SESSION['Username']=$sle[0]['Username'];
			$_SESSION['UserId']=$sle[0]['ID'];
			$_SESSION['session_id']=session_id();
			header("Location:controlpanel.php"); // redirecting
		}
		else
		{
			$objSmarty->assign("ErrorMessage", "Invalid Username and Password"); // display when username and password not in database rajasri_drs
		}
	}
	
	function chklogin()
	{
		if(!isset($_SESSION['UserId']) && $_SESSION['UserId']=="")
		{
			header("Location:index.php");  // redirecting
		}
	}
	function insertdetails()
	{
		global $objSmarty,$config;
		$rat_date=explode("/", $_REQUEST['ratingdate']);
		$newdate=$rat_date[2]."-".$rat_date[1]."-".$rat_date[0];
		$newResourceid = $_REQUEST['resource'];
		$newnotes=$_REQUEST['notes'];	
		$enterCode= $_REQUEST['code'];
		// Checking for duplicate records in rating table
		$checkvar = "SELECT * FROM rating WHERE RatingDate = '$newdate' AND ResourceID = '$newResourceid' AND CodeID = (SELECT ID FROM code WHERE Code='$enterCode') ";
		$execvar = mysql_query($checkvar);
		if (mysql_num_rows($execvar) > 0) 
		{
			return false;
       		}
		else
		{		
		// Insert details into rating table
		$a = "INSERT INTO rating(RatingDate,
					 ResourceID,
					 CodeID,
					 Notes,
					 CreatedBy) 
				         VALUES 
				      	 ('$newdate','$newResourceid',(SELECT ID FROM code WHERE Code='$enterCode'),'$newnotes','".$_SESSION['UserId']."')"; 
		$this->ExecuteQuery($a, "insert");
		header("location:rating.php?successmsg=3");// redirecting
		}		
	}
	function display()
	{
		global $objSmarty,$config;
		// Displays the records of current date 
		$datetemp = date("y/m/d");  
		$tempdisvar= "SELECT * FROM rating r,resource re,code c WHERE r.ResourceID=re.ID and r.CodeID=c.ID and r.RatingDate=' $datetemp' ";
		$displaydet= $this->ExecuteQuery($tempdisvar, "select");
		$objSmarty->assign('displaydet', $displaydet);
	}
	function deleterow($id)
	{
		global $objSmarty,$config;
		//Delete the corresponding record from rating table 
		$tempdrop = "DELETE FROM rating WHERE RatingID ='$id'";
		$this->ExecuteQuery($tempdrop, "delete");
		header("location:rating.php?successmsg=2");// redirecting
	}
	function get_RatingID($id)
	{
		global $objSmarty,$config;
		//Get the details from table for edit option
		$datetemp = date("y/m/d");  
		echo $tempdisvar= "SELECT * FROM rating r,resource re,code c 
				   WHERE r.ResourceID=re.ID and r.CodeID=c.ID 
				   AND r.RatingID=' $id'";
		$displaydet= $this->ExecuteQuery($tempdisvar, "select");
		$objSmarty->assign('getRating', $displaydet);
	}
	function Update_rating($Id)
	{
		global $objSmarty,$config;
		//$uprdate = $_REQUEST['ratingdate'];
		$rat_date=explode("/", $_REQUEST['ratingdate']);
		$uprdate=$rat_date[2]."-".$rat_date[1]."-".$rat_date[0];
		$upresid = $_REQUEST['resource'];
		$upnotes=$_REQUEST['notes'];	
		$upcodeid= $_REQUEST['code'];	
		// update details into Rating Table
		$tempvar = " UPDATE rating SET RatingDate= '$uprdate ',
					 ResourceID = '$upresid',
					 CodeID =(SELECT ID FROM code WHERE Code='$upcodeid'),
					 Notes='$upnotes' WHERE RatingID ='$Id'";
		$this->ExecuteQuery($tempvar, "update");
		header("location:rating.php?successmsg=1");// redirecting
	}	
}
?>
