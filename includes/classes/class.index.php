<?php
class Login extends MysqlFns
{

	function Login()
		{
		global $config;
        	$this->MysqlFns();
		$this->Offset			= 0;
		$this->Limit			= 15;
		$this->page				= 0;
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
					header("Location:controlpanel.php");
			}
			else
			{
				$objSmarty->assign("ErrorMessage", "Invalid Username and Password");
			}
	}
	
	function chklogin()
	{
		if(!isset($_SESSION['UserId']) && $_SESSION['UserId']=="")
		{
			header("Location:index.php");
		}
	}
	function insertdetails()
	{
			global $objSmarty,$config;
			/* $a = "SELECT Username FROM userinfo WHERE userinfo.Username = '$user'";
			$b = mysql_query($a);
			if (mysql_num_rows($b) > 0) 
				{
					echo "Please try different username ! already exists";
					return false;
        			}
			else	
			*/	
			$newdate = $_REQUEST['ratingdate'];
			$newResourceid = $_REQUEST['resource'];
			$newnotes=$_REQUEST['notes'];	
			$enterCode= $_REQUEST['code'];
			$temp = " SELECT ID from code WHERE Code='$enterCode'";
			$newcodeid=$this->ExecuteQuery($temp,"select");		
			$a = "INSERT INTO rating(RatingDate,
						 ResourceID,
						 CodeID,
						 Notes) 
					      VALUES 
						('$newdate','$newResourceid','$newcodeid','$newnotes')"; 
			$b = $this->ExecuteQuery($a, "insert");
			$objSmarty->assign("success","Data uploaded successfully");		
	}
	/*function rptpage()
	{
		
	}*/
}
?>
