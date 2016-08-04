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
		/*$tesratdate = "SELECT RatingDate FROM rating";			
		$ratdate = $this->ExecuteQuery($tesratdate, "select");
		$couvar = count($ratdate);
		for ($x = 0; $x < $couvar; $x++) 
		{
			$rat_date[$x] = explode("-", $ratdate[$x]['RatingDate']);
		}
		for($i=0; $i< $couvar;$i++)
		{
		if($rat_date[$i][1]== $getmon && $rat_date[$i][0] == $getyr)
			{ 
		     	$resource="SELECT ResourceID FROM rating WHERE RatingDate ='".$rat_date[$i][0]."-".$rat_date[$i][1]."-".$rat_date[$i][2]."'";
		    	$exeresource = $this->ExecuteQuery($resource,"select");
		   	$resid=$exeresource[0]['ResourceID'];
			$rptshw = "SELECT ResourceInitial FROM resource WHERE ID = '$resid'";
			$resdata = $this->ExecuteQuery($rptshw,"select");
			$resinitial[]=$resdata[0]['ResourceInitial'];
			}
		} */
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
		/*$tesratdate = "SELECT RatingDate FROM rating";			
		$ratdate = $this->ExecuteQuery($tesratdate, "select");
		$couvar = count($ratdate);
		for ($x = 0; $x < $couvar; $x++) 
		{
			$rat_date[$x] = explode("-", $ratdate[$x]['RatingDate']);
		}
		print_r($rat_date);
		for($i=0; $i< $couvar;$i++)
		{
		if($rat_date[$i][1]== $getmon && $rat_date[$i][0] == $getyr)
			{ 
		     	echo $resource="SELECT Notes FROM rating WHERE ResourceID = '".$getini."' AND RatingDate ='".$rat_date[$i][0]."-".$rat_date[$i][1]."-".$rat_date[$i][2]."' ";
		    	$exeresource = $this->ExecuteQuery($resource,"select");
			    $noteone[]=$exeresource[0]['Notes'];
			}
		}print_r($noteone);exit;*/
		$date=$getmon.'/'.$getyr;
		$select="select * from rating where ResourceID='".$getini."' and date_format(RatingDate, '%m/%Y')='".$date."'";
		$exeresource = $this->ExecuteQuery($select,"select");
		$objSmarty->assign('oneresdata',$exeresource);
	
	}
	
}
?>
