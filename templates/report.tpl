<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
{literal}
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="css/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
function tbl_view()
	{
		/*if(document.getElementById('month').value=='')
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
		{*/
			month=document.getElementById('month').value;
			year=document.getElementById('year').value;
			newresid=document.getElementById('newresid').value;
			dataction=document.getElementById('dataction').value;
			resource=2;
			$.ajax({
				url:'getresource.php',
				type: "POST",
			  	  data: "month="+month+"&year="+year+"&newresid="+newresid+"&resource="+resource,
				success:function(data){
					if(data  != ""){
						//alert(data);
			        	//data=data.split("@@@"); 
			        	//$('#numrec').val(data[0]);
			    		document.getElementById('mgrid').innerHTML=data;
			        	return true;
					}else{
					}
			    }
			    	    
			 });
		$( "#radio1" ).prop( "checked", true );
		//}
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
		/*document.getElementById("dataction").value='1';
		document.rptpage.submit();*/
		    //document.getElementById("dataction").value=1;
			month=document.getElementById('month').value;
			year=document.getElementById('year').value;
			newresid=document.getElementById('newresid').value;
			dataction=document.getElementById('dataction').value;
			resource=1;
			$.ajax({
				url:'getresource.php',
				type: "POST",
			    data: "month="+month+"&year="+year+"&newresid="+newresid+"&resource="+resource,
				success:function(data){
					if(data  != ""){
						//alert(data);
			        	data=data.split("@@@"); 
			        	$('#numrec').val(data[0]);
			    		document.getElementById('mgrid').innerHTML=data[1];
			        	return true;
					}else{
						//alert('hi');
					}
			    }
			    	    
			 });
		}
		$( "#radio" ).prop( "checked", true );
	}	
$(document).ready(function(){
	tbl_report();
});
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
					<select id="month" name="month" onchange="return tbl_view();">
					<option value="">--Month--</option>					
					{foreach key=k item=v from=$months}	
					<option value='{$k}' {if $k eq $currentMonth}selected{/if}>{$v} </option>
 					{/foreach}
					</select>
					<select id="year" name="year" onchange="return tbl_view();">	
					<option value="">--Year--</option>				
					{foreach key=yk item=yv from=$year}	
					<option value='{$yv}' {if $yv eq $currentYear}selected{/if}>{$yv} </option>
 					{/foreach}
					</select>
				 </td>
				<input type="hidden" name="dataction" id="dataction">
				<input type="hidden" name="numrec" id="numrec">
				<input type="hidden" name="singlerestemp" id="singlerestemp">
				<td width="10%" nowrap="nowrap" style="text-align:right;">Resource:</td>
				<td width="5%">
				<input type ="radio" id="radio" name = "radio" onclick="return tbl_report();"> 
	               		<span style="text-align:right" width="6%"valign="top">All</span>
	            		</td>
              			<td width="21%">
				<input type ="radio" id="radio1" name = "radio"  onclick="return tbl_view();"> 
	             		<span style="text-align:left;" width="10%" valign="top" nowrap="nowrap" >Individual</span>
	          		<select id="newresid" name="newresid" style="width: 120px;" onchange="return tbl_view();">
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
	
	<div class="report_view" id="mgrid" >
		<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<tr>
				<th>S.No.</th>
				<th>Resource</th>
				<th>Beginning Rate</th>
				<th>End Rate</th>
			</tr> 
			<tr>
				<td colspan="5"> No records found </td>
			</tr>
			
		</table>
	</div>
 </div>
</div>
</div>	
</body>
</html>
