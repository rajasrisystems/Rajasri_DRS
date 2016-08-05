<?php
class Admin extends MysqlFns
{

	function Admin()
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
	function Admin_newuser()
	{
		global $objSmarty;
		$newAd_name= $_POST['admin_text'];
		$newAd_pass = $_POST['admin_password'];
		$select="select * from admin where Username = '".$newAd_name."'";
		$count=$this->ExecuteQuery($select,'norows');// If the Resource initial is not in the table
			if($count == 0)//the count will be 0 so insert query will happen --- otherwise dont insert ---
			{
				$ad_insrt = "INSERT INTO admin(Username, Password)values('".trim(addslashes($newAd_name))."','".$newAd_pass."')";
				$inst_var = $this->ExecuteQuery($ad_insrt,'insert');
				$objSmarty->assign("SuccessMessage", "Admin details added successfully");
			}else{
				$objSmarty->assign("ErrorMessage", "Admin details already exists");
			}
		
	}
	
	function Admin_updateuser($id)
	{
		global $objSmarty,$config;
		$upusername = $_REQUEST['admin_text'];
		$uppassword = $_REQUEST['admin_password'];
		$select="select * from admin where Username = '".$upusername."'";
		$count=$this->ExecuteQuery($select,'norows');
		if($count == 0)//the count will be 0 so insert query will happen --- otherwise dont insert ---
			{
				$tempvar = "UPDATE admin SET Username = '$upusername', Password='$uppassword' where ID = '$id'";
				$count = $this->ExecuteQuery($tempvar ,'update');
				$objSmarty->assign("SuccessMessage", "Admin details updated successfully");
			}else
			{
				$objSmarty->assign("ErrorMessage", "Admin details already exists");
			}
		
	}
	
	
	function show_adminuser()
	{
		global $objSmarty;
		$newRs_name= $_POST['admin_text'];
		$newRs_init = $_POST['admin_password'];
		$dis_res = "select * from admin order by Username asc";
		$res =$this->ExecuteQuery($dis_res,'select');
		$objSmarty->assign('showval',$res);
	}
	
	/*function Update_rating($Id)
	{
		global $objSmarty,$config;
		//$uprdate = $_REQUEST['ratingdate'];
		$upresid = $_REQUEST['ad_txt'];
		$upnotes=$_REQUEST['ad_pass'];	
		// update details into Rating Table
		$tempvar = " UPDATE admin SET Username = '$upresid ',Password = '$upnotes'";
		$this->ExecuteQuery($tempvar, 'update');
		$objSmarty->assign("SuccessMessage", "Admin details updated successfully");
	}*/
	
	function getAdminbyId($id)
	{
		global $objSmarty,$config;
		//Get the details from table for edit option
		echo $tempdisvar= "SELECT * FROM admin where ID= ' $id'";
		$displaydet= $this->ExecuteQuery($tempdisvar, "select");
		$objSmarty->assign('adminDetails', $displaydet);
	}
	
	
	function del_adusers($id)
	{
		global $objSmarty,$config;
		//Delete the corresponding record from rating table 
		$tempdrop = "DELETE FROM admin WHERE ID ='$id'";
		$this->ExecuteQuery($tempdrop, "delete");
		header("location:admin.php?successmsg=2");// redirecting
	}

}