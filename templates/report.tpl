<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
{literal}
<script>
function tbl_view()
	{
		if(document.getElementById('month').value=='')
		{
			alert('Please select month');
			document.getElementById('month').focus();
			return false;
		}
		if(document.getElementById('year').value=='')
		{
			alert('Please select year');
			document.getElementById('year').focus();
			return false;
		}
		if(document.getElementById('newresid').value=='')
		{
			alert('Please select initial');
			document.getElementById('newresid').focus();
			return false;
		}
		else
		{
		document.getElementById("singlerestemp").value='1';
		document.rptpage.submit();
		}
	}
function tbl_report()
	{
		if(document.getElementById('month').value=='')
		{
			alert('Please select month');
			document.getElementById('month').focus();
			return false;
		}
		if(document.getElementById('year').value=='')
		{
			alert('Please select year');
			document.getElementById('year').focus();
			return false;
		}
		else
		{
		document.getElementById("dataction").value='1';
		document.rptpage.submit();
		}
	}	
function sel_val(val)
	{
		if(val!="")
		{
		document.rptpage.submit();
		}
				
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
				<th colspan="9" style="text-align:left">Reports</th>
				<tr>
				<div class="Error" align="center" id="errmsg"></div>
				 <td width="10%" nowrap="nowrap">Select Month & Year:</td>
				 <td width="21%">
					<select id="month" name="month">
					<option value="">--Month--</option>					
					{foreach key=k item=v from=$months}	
					<option value='{$k}'>{$v} </option>
 					{/foreach}
					</select>
					<select id="year" name="year">	
					<option value="">--Year--</option>				
					{foreach key=yk item=yv from=$year}	
					<option value='{$yv}'>{$yv} </option>
 					{/foreach}
					</select>
				 </td>
				<input type="hidden" name="dataction" id="dataction">
				<input type="hidden" name="singlerestemp" id="singlerestemp">
				<td width="10%" nowrap="nowrap" style="text-align:right;">Resource:</td>
				<td width="5%">
				<input type ="radio" id="radio" name = "radio"  onclick="return tbl_report(); showHide();"> 
	               		<span style="text-align:right" width="6%"valign="top">All</span>
	            		</td>
              			<td width="21%">
				<input type ="radio" id="radio1" name = "radio"  onclick="return tbl_view();"> 
	             		<span style="text-align:left;" width="10%" valign="top" nowrap="nowrap" >Individual</span>
	          		<select id="newresid" name="newresid" style="width: 120px;">
						<option value="">--Resource--</option>
						{foreach item=resource from=$tabresdata}
						<option value='{$resource.ID}'>{$resource.ResourceInitial}</option>
						{/foreach}	
				</select>   
	           		</td>
               			<td style="text-align:right;"> <a href="#" style ="color:blue;"><img src="img/pdf.png" width="20px">&nbsp;Export to PDF</a>  </td>
	         		</tr>
	         		</tr>
	         		</tr>
	         	</table>
		</form>
	      </div>	  
	<br/>
	{if $hidshowvar eq 'oneres'}
	<div class="report_view" id="report" >
		<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<tr>
				<th>S.No.</th>
				<th>Resource</th>
				<th>Beginning Rate</th>
				<th>End Rate</th>
			</tr> 
			{assign var="i" value=1}
			{section name="h" loop=$resdata}
			<tr>
				<td>{$i}</td>
				<td>{$resdata[h].ResourceInitial}</td>
				<td>50</td>
				<td>50</td>
			</tr>
			{assign var="i" value=$i+1}
			{sectionelse}
			<tr>
				<td colspan="5"> No records found</td>
			</tr>
			{/section}
		</table>
	</div>
  	
	{elseif $showhidvar eq 'allres'}
	<div class="report_view" id="mgrid">
		<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<tr>
				<th>S.No.</th>
				<th>Date</th>
				<th>Change</th>
				<th>Rating</th>
				<th>Notes</th>
			</tr> 
			{assign var="i" value=1}
			{section name="indR" loop=$oneresdata}
			<tr>
				<td>{$i}</td>
				<td>{$oneresdata[indR].RatingDate|date_format:"%d/%m/%Y"}</td>
				<td> </td>
				<td>50</td>
				<td>{$oneresdata[indR].Notes}</td>
			</tr>
			{assign var="i" value=$i+1}
			{sectionelse}
			<tr>
				<td colspan="5"> No records found </td>
			</tr>
			{/section}
		</table>
	</div>
	{/if}
 </div>
</div>
</div>	
</body>
</html>
