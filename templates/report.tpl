<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
{literal}
<script>
function tbl_view()
	{
		document.getElementById("report").style.display = "none";
		document.getElementById("mgrid").style.display = "block";
	}
function tbl_report()
	{
		document.getElementById("report").style.display = "block";
		document.getElementById("mgrid").style.display = "none";
		//document.getElementById("res").value = "";
		//document.rptpage.submit();
	}	
function sel_val(val)
	{
		if(val!="")
		{
		document.rptpage.submit();
		}
				
	}
function getdate()
	{
		$setval = document.getElementById("period").value;
	}
</script>
{/literal}
<!--Design Prepared by Rajasri Systems-->   
<body>
<div id="wrapper">
<div style="clear:both;"></div>	
<div id="middle"> 
  <div id="center-column">
    <div class="top-bar-header">
		<h1>Reports</h1>
		<div class="breadcrumbs"><a href="controlpanel.php" >Homepage</a> >> Reports</div>
		</div>
		<br/>
		<div class = "manage-grid">
			<div class="report-page" style="text-align:left;">
				<form action="report.php" name="rptpage" method="post">
				<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="9" style="text-align:left">Reports</th> 	<!-- <select	width="10%"> -->
				<tr>
				 <td width="10%" nowrap="nowrap">Select Month & Year:</td>
				 <td width="21%">
				 	<input type="hidden" name="reportdate" id="reportdate" value="">
					{html_select_date display_days=false end_year='+14' all_extra='id="period"' all_extra='onchange="return getdate();"'} 		
				 </td>
				<td width="10%" nowrap="nowrap" style="text-align:right;">Resource:</td>
				<td width="5%"><input type = "radio" id="rdo2" value ="" name = "radio" onclick="tbl_report()" checked > <!-- rdo2 button for All Resource   -->
	               <span style="text-align:right" width="6%"valign="top">All</span>
	            </td>
               <td width="21%"><input type = "radio" id="rdo1" name="radio" value ="individuals"name = "radio" onclick="tbl_view()" {if $smarty.request.resourceId neq ""}checked{/if}>
	             <span style="text-align:left;" width="10%" valign="top" nowrap="nowrap" >Individual</span> <!-- Rdo1-individuals  -->

	             <select id="res" name="resourceId" style="width: 120px;" onchange="sel_val(this.value)"> 
		         <option value="">--Select--</option>
			 {foreach item=res from=$resdata}<p><option value='{$res.ID}' {if $res.ID eq $smarty.request.resourceId}selected{/if}>{$res.ResourceInitial}</option></p>{/foreach}
	             </select>
				<!-- <td><input type="button"name="submit" value="Submit"></input></td> -->
	           </td>
               <td style="text-align:right;"> <a href="#" style ="color:blue;"><img src="img/pdf.png" width="20px">&nbsp;Export to PDF</a>  </td>
	         </tr>
	         </tr>
	         </tr>
	         </table>
	      </div>	  
	
	<br/>
   <div class="report_view" id="mgrid" style="display:none;">
		<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<tr>
				<th>S.No.</th>
				<th>Date</th>
				<th>Change</th>
				<th>Rating</th>
				<th>Notes</th>
			</tr> 
			{assign var="i" value=1}
			{section name="indR" loop=$rptshw}
			<tr>
				<td>{$i}</td>
				<td>{$rptshw[indR].RatingDate}</td>
				<td></td>
				<td>50</td>
				<td>{$rptshw[indR].Notes}</td>
			</tr>
			{assign var="i" value=$i+1}
			{sectionelse}
			<tr>
				<td colspan="5"> No records found </td>
			</tr>
			{/section}
			
			
		</table>
	</div>
	
	<div class="report_view" id="report">
		<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<tr>
				<th>S.No.</th>
				<th>Resource</th>
				<th>Beginning Rate</th>
				<th>End Rate</th>
			</tr> 
			{assign var="i" value=1}
			{section name="h" loop=$rptshw}
			<tr>
				<td>{$i}</td>
				<td>{$objReport->getResourceName($rptshw[h].ResourceID)}</td>
				<td>50</td>
				<td>50</td>
			</tr>
			{assign var="i" value=$i+1}
			{/section}
			
		</table>
	</div>
 </div>
</div>
</div>	
</body>
</html>
