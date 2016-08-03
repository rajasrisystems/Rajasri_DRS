<?php
class Resource extends MysqlFns
{

	function Resource()
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
	function ResourceAdding()
	{
		global $objSmarty;
		$newRs_name= $_POST['resource_text'];
		$newRs_Init = $_POST['resource_initial'];
		$select="select * from resource where ResourceInitial = '".$newRs_Init."'";
		$count=$this->ExecuteQuery($select,'norows');// If the Resource initial is not in the table
			if($count == 0)//the count will be 0 so insert query will happen --- otherwise dont insert ---
			{
				$rs_insrt = "INSERT INTO resource(ResourceName, ResourceInitial)values('".$newRs_name."','".$newRs_Init."')";
				$inst_var = $this->ExecuteQuery($rs_insrt,'insert');
				$objSmarty->assign("SuccessMessage", "Resource inserted successfully");
			}else{
				$objSmarty->assign("ErrorMessage", "Resource initial already exists");
			}
		
		
	}
		
}	
	
?>
