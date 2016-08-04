<?php
include "includes/common.php";

include_once "includes/classes/class.report.php";

/* all resource */
$objReport = new Report();
global $config;
if($_REQUEST['resource'] != '' &&  $_REQUEST['resource'] == '1')
{
	$getmon = $_REQUEST['month'];
	$getyr  = $_REQUEST['year'];
	$date=$getmon.'/'.$getyr;
	$select="select * from rating r,resource re where date_format(r.RatingDate, '%m/%Y')='".$date."' and re.ID=r.ResourceID group by r.ResourceID";
	$result=mysql_query($select);
	$num=mysql_num_rows($result);
	echo $num."@@@";
	echo'<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<tr>
				<th>S.No.</th>
				<th>Resource</th>
				<th>Beginning Rate</th>
				<th>End Rate</th>
			</tr> ';?>
	<?php
	$c=1;

	if($num!=''){
		while($rows=mysql_fetch_array($result)){

			$ResourceID=$rows['ResourceID'];
			$CodeID =$rows['CodeID'];
			$previousmonth=date("m/Y", strtotime("first day of previous month"));
			$month_days=date("j", strtotime("last day of previous month"));
			$day = date("d");  // current date
			$prepoints=$month_days*50; // prev month
			$nprepoints=$day*50; // cur month
			 
			/******************************** For Previous Month**************************************/
			$result_date= "SELECT * FROM rating where date_format(RatingDate, '%m/%Y')='".$previousmonth."' and ResourceID='$ResourceID'";
			$exequery=mysql_query($result_date);
			$num_rows=mysql_num_rows($exequery);
			$points=0;
			if($num_rows>0)
			{

				while($row2=mysql_fetch_array($exequery)){
						
					$sql = "SELECT * FROM code where ID='".$row2['CodeID']."'";
					$getexe = $objReport->ExecuteQuery($sql, "select");
					$points+= $getexe[0]['Points'];
				}
			}
			//echo $points;
			if($points != '')
			{
				$tot= ($points + $prepoints)/$month_days;
				$begin_points=(round($tot,2));
			}
			else
			{
				$begin_points=50;
			}
			/******************************** For Previous Month**************************************/
			/******************************** For current Month**************************************/
			//$ppoints=0;
			$presult_date= "SELECT * FROM rating where date_format(RatingDate, '%m/%Y')='".$date."' and ResourceID='$ResourceID'";
			$pexequery=mysql_query($presult_date);
			$pnum_rows=mysql_num_rows($pexequery);
				
			if($pnum_rows>0)
			{

				while($prow2=mysql_fetch_array($pexequery)){
						
					$psql = "SELECT * FROM code where ID='".$prow2['CodeID']."'";

					$pgetexe = $objReport->ExecuteQuery($psql, "select");
					//print_r($pgetexe);
					$ppoints+= $pgetexe[0]['Points'];
						
				}
			}
			print_r($ppoints);
			if($ppoints != '')
			{
				$ptot= ($ppoints + $nprepoints)/$day;
				$end_points=(round($ptot,2));
			}
			else
			{
				//$end_points=50;
			}
			/******************************** For current Month**************************************/
				
			echo'
	 <tr>
				<td>'.$c.'</td>
				<td>'.$rows['ResourceInitial'].'</td>
				<td>'.$begin_points.'</td>
				<td>'.$end_points.'</td>
	</tr>
	 ';
			$c++;
		}

	}
	else
	{
		echo' <tr >
			     <td colspan="5">No records available</td>
  			</tr> ';
	}
}
/************** one resource *******************/
if($_REQUEST['resource'] != '' &&  $_REQUEST['resource'] == '2')
{
	$getmon = $_REQUEST['month'];
	$getyr  = $_REQUEST['year'];
	$getini = $_REQUEST['newresid'];
	$firstDate=$getyr.'-'.$getmon.'-01';
	$numberOfDays=cal_days_in_month(CAL_GREGORIAN, $getmon, $getyr);
	$lastDate=date("Y-m-t", strtotime($firstDate));
	$date=$firstDate;
	$datesArr[]=$date;
	for($i=1;$i<$numberOfDays;$i++){
		$date=date('Y-m-d', strtotime($date . ' +1 day'));
		$datesArr[]=$date;
	}
	//print_r($datesArr);
	echo '<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<tr>
				<th>S.No. </th>
				<th>Date</th>
				<th>Change</th>
				<th>Rating</th>
				<th>Notes</th>
			</tr>  ';
	$c=0;
	$today=date('Y-m-d');
	foreach($datesArr as $date){
		if($date <= $today){
			$select_res="select * from rating where ResourceID='".$getini."' and RatingDate='".$date."' order by RatingDate desc";
			$exe_res=$objReport->ExecuteQuery($select_res, "select");
			$count_res=$objReport->ExecuteQuery($select_res, "norows");
			if($count_res > 0){
				$codeId=$exe_res[0]['CodeID'];
				$selectChange="select * from code where ID='".$codeId."'";
				$exeChange=$objReport->ExecuteQuery($selectChange, "select");
				$change=$exeChange[0]['Points'];
				$newPoint=$config['DefaultPoint']+$change;
				$pointsArr[]=$newPoint;
				echo '<tr>
					<td>'.++$c.'</td>
					<td>'.date("d/m/Y",strtotime($date)).'</td>
					<td>'.$change.' </td>
					<td>'.$newPoint .'</td>
					<td>'.$exe_res[0]['Notes'].'</td>
				</tr>';
			}else{
				$newPoint=$config['DefaultPoint'];
				$pointsArr[]=$newPoint;
				echo '<tr>
					<td>'.++$c.'</td>
					<td>'.date("d/m/Y",strtotime($date)).'</td>
					<td>&nbsp;</td>
					<td>'.$newPoint .'</td>
					<td>'.$exe_res[0]['Notes'].'</td>
				</tr>';
			}
		}
	}
	$average=number_format((array_sum($pointsArr))/($numberOfDays),2);
	echo'<tr>
				<td colspan="3"><b>Average</b></td>
				<td><b>'.$average.'</b></td>
				<td> </td>
			</tr>  ';
	echo '</table>';
}
	/*$select_res="select * from rating where ResourceID='".$getini."' and
	date_format(RatingDate, '%m/%Y')='".$date."' ORDER BY `RatingDate` ASC ";
	$res=mysql_query($select_res);
	$number=mysql_num_rows($res);
	echo $number."@@@";
	echo'<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<tr>
				<th>S.No. </th>
				<th>Date</th>
				<th>Change</th>
				<th>Rating</th>
				<th>Notes</th>
			</tr>  ';
	$c=1;
	$points=0;
	if($number!=''){
		while($row=mysql_fetch_array($res)){
			$cday = date("d");
			$prepoints=$cday*50;
			$code=$row['CodeID'];
			$sql = "SELECT * FROM code where ID='$code'";
			$getexe = $objReport->ExecuteQuery($sql, "select");
			$curpoint = $getexe[0]['Points'];
			$points += $getexe[0]['Points'];
			$newrate = $curpoint + 50;
			if($points != '')
			{
				$ptot= ($points + $prepoints)/$cday;
				$average=(round($ptot,2));
			}
			$dbdate=$row['RatingDate'];
			$date=date('Y-m-01');
			$end_date=date('Y-m-d');

			while (strtotime($date) <= strtotime($end_date)) {
				//echo "$date\n";
				if($dbdate == $date)
				{
				echo'<tr>
				<td>'.$c.'</td>
				<td>'.date("d/m/Y",strtotime($row['RatingDate'])).'</td>
				<td>'. $curpoint.' </td>
				<td>'.$newrate .'</td>
				<td>'. $row['Notes'].'</td>
			</tr>
	     ';
					echo $date;
				}
				else
				{
					echo'<tr>
				<td>'.$c.'</td>
				<td>'.date("d/m/Y",strtotime($date)).'</td>
				<td> </td>
				<td>50</td>
				<td></td>
			</tr>
	          ';
					echo $date;
					 
				}


				$date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
			}

			$c++;
		}

		echo'
			<tr>
				<td colspan="3"><b>Average</b></td>
				<td><b>'.$average.'</b></td>
				<td> </td>
			</tr>  ';
	}
	else
	{
		echo' <tr >
     <td colspan="5">No records available</td>
  </tr> ';
	}
}*/


?>
