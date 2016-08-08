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
		$newAd_first=$_POST['admin_fname'];
		$newAd_name= $_POST['admin_text'];
		$newAd_pass = $_POST['admin_password'];
		$select="select * from admin where Username = '".$newAd_name."'";
		$count=$this->ExecuteQuery($select,'norows');// If the Resource initial is not in the table
			if($count == 0)//the count will be 0 so insert query will happen --- otherwise dont insert ---
			{
				$ad_insrt = "INSERT INTO admin(Name, Username, Password)values('".trim($newAd_first)."','".trim(addslashes($newAd_name))."','".$newAd_pass."')";
				$inst_var = $this->ExecuteQuery($ad_insrt,'insert');
				$objSmarty->assign("SuccessMessage", "Admin details added successfully");
			}else{
				$objSmarty->assign("ErrorMessage", "Admin details already exists");
			}
		
	}
	
	function Admin_updateuser($id)
	{
		global $objSmarty,$config;
		$upfirstname=$_REQUEST['admin_fname'];
		$upusername = $_REQUEST['admin_text'];
		$uppassword = $_REQUEST['admin_password'];
		$select="select * from admin where Username = '".$upusername."' and ID!='$id'";
		$count=$this->ExecuteQuery($select,'norows');
		if($count == 0)//the count will be 0 so insert query will happen --- otherwise dont insert ---
			{
				$tempvar = "UPDATE admin SET Name='$upfirstname', Username = '$upusername', Password='$uppassword' where ID = '$id'";
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
		$orderBy='';
		if(isset($_REQUEST['sortflag']) && $_REQUEST['sortflag']!='')
		{
			if($_REQUEST['sortflag']=='1')
			{
				$orderBy.="order by Name asc";
			}
			elseif($_REQUEST['sortflag']=="2")
			{
				$orderBy.="order by Name desc";
			}
			elseif($_REQUEST['sortflag']=='3')
			{
				$orderBy.="order by Username asc";
			}
			elseif($_REQUEST['sortflag']=='4')
			{
				$orderBy.="order by Username desc";
			}
		}
		else
		{
			$orderBy.="order by Name asc";
		}
		$newRs_fname=$_POST['admin_fname'];
		$newRs_name= $_POST['admin_text'];
		$newRs_init = $_POST['admin_password'];
		$dis_res = "select * from admin $orderBy";
		$res =$this->ExecuteQuery($dis_res,'select');
		$objSmarty->assign('showval',$res);
	}
	function getAdminbyId($id)
	{
		global $objSmarty,$config;
		//Get the details from table for edit option
		$tempdisvar= "SELECT * FROM admin where ID= ' $id' ";
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
