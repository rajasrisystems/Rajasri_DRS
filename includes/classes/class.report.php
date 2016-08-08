<?php 
class Report extends MysqlFns
{
	function Report()
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
	// All resources
	function allresource()
	{
		global $objSmarty;
		$getmon = $_REQUEST['month'];
		$getyr  = $_REQUEST['year'];
		
		$date=$getmon.'/'.$getyr;
		$select="select * from rating r,resource re where date_format(r.RatingDate, '%m/%Y')='".$date."' and re.ID=r.ResourceID group by r.ResourceID";
		$exeresource = $this->ExecuteQuery($select,"select");
		$objSmarty->assign('resdata',$exeresource);
			
	}
	function oneresource()
	{
		global $objSmarty;
		$getmon = $_REQUEST['month'];
		$getyr  = $_REQUEST['year'];
		$getini = $_REQUEST['newresid'];
		
		$date=$getmon.'/'.$getyr;
		$select="select * from rating where ResourceID='".$getini."' and date_format(RatingDate, '%m/%Y')='".$date."'";
		$exeresource = $this->ExecuteQuery($select,"select");
		$objSmarty->assign('oneresdata',$exeresource);
	
	}
	function getuserbyId($id)
	{
		global $objSmarty,$config;
		//Get the details from table for edit option
		$tempdisvar= "SELECT * FROM admin where ID= ' $id' ";
		$displaydet= $this->ExecuteQuery($tempdisvar, "select");
		//$objSmarty->assign('adminDetails', $displaydet);
		return $displaydet[0]['Username'];
	}
	
}
?>
