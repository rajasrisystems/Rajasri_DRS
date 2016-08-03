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
		$newAd_name= $_POST['Admin_name'];
		$newAd_pass = $_POST['Admin_password'];
		$select="select * from admin where Username = '".$newAd_name."'";
		$count=$this->ExecuteQuery($select,'norows');// If the Resource initial is not in the table
			if($count == 0)//the count will be 0 so insert query will happen --- otherwise dont insert ---
			{
				$ad_insrt = "INSERT INTO admin(Username, Password)values('".trim(addslashes($newAd_name))."','".$newAd_pass."')";
				$inst_var = $this->ExecuteQuery($ad_insrt,'insert');
				$objSmarty->assign("SuccessMessage", "Username added successfully");
			}else{
				$objSmarty->assign("ErrorMessage", "Username already exists");
			}
		
	}
}