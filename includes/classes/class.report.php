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
	function getAllResources()
	{
		global $objSmarty;
		$report_date=explode("/", $_REQUEST['ratingdate']);
		$newdate=$rat_date[2]."-".$rat_date[1]."-".$rat_date[0];



		$disvar = "SELECT * FROM resource";
		$result = $this->ExecuteQuery($disvar,"select");
		$objSmarty->assign('resdata', $result);	
	}
	function getAllRating()
	{
		global $objSmarty,$config;

		$where='';
		if(isset($_REQUEST['resourceId']) && $_REQUEST['resourceId']!=""){
			$where.="and ResourceID='".$_REQUEST['resourceId']."'";
		}
		if($_REQUEST['Date_Month']!="" && $_REQUEST['Date_Year']!=""){
			$date=$_REQUEST['Date_Month'].'/'.$_REQUEST['Date_Year'];
			$where.="and date_format(RatingDate,'%m/%Y')='".$date."'";
		}
		$rptshw = "SELECT * FROM rating where 1 $where";
		$data=$this->ExecuteQuery($rptshw, "select");
		$objSmarty->assign('rptshw', $data);
	}

	function getResourceName($ResourceID)
	{
		global $objSmarty;
		$rptshw = "SELECT * FROM resource where ID = '".$ResourceID."'";
		$data=$this->ExecuteQuery($rptshw, "select");
		return $data[0]['ResourceInitial'];
	}
	// function slctdisp()
	//{
	//	global $objSmarty;
		 
	//	$tempdisvar= "SELECT * FROM rating r,resource re WHERE r.ResourceID=re.ID";
	//	$displaydet= $this->ExecuteQuery($tempdisvar, "select");
	//	$objSmarty->assign('displaydet', $displaydet);
	//}
}






?>
