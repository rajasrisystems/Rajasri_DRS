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
		}*/
		if(document.getElementById('newresid').value=='')
		{
			alert('Please select initial');
			document.getElementById('newresid').focus();
			return false;
		}
		else
		{
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
			    		document.getElementById('mgrid').innerHTML=data;
			        	return true;
					}else{
					}
			    }
			    	    
			 });
		$( "#radio1" ).prop( "checked", true );
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
		/*document.getElementById("dataction").value='1';
		document.rptpage.submit();*/
		    //document.getElementById("dataction").value=1;
			month=document.getElementById('month').value;
			year=document.getElementById('year').value;
			document.getElementById('newresid').value='';
			dataction=document.getElementById('dataction').value;
			resource=1;
			$.ajax({
				url:'getresource.php',
				type: "POST",
			    data: "month="+month+"&year="+year+"&resource="+resource,
				success:function(data){
					if(data  != ""){
					//alert(data);
			        	data=data.split("@@@"); 
			        	$('#numrec').val(data[0]);
			    		document.getElementById('mgrid').innerHTML=data[1];
			        	return true;
					}else{
					}
			    }
			    	    
			 });
		}
		$( "#radio" ).prop( "checked", true );
	}	
$(document).ready(function(){
	tbl_report();
	$( "#radio" ).prop( "checked", true );

$("#exportBtn").click(function(e) {
	
	var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
	var textRange; var j=0;
	tab = document.getElementById('exporttable'); // id of table

	for(j = 0 ; j < tab.rows.length ; j++)
	{	
		tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
		//tab_text=tab_text+"</tr>";
	}
	tab_text=tab_text+"</table>";
	//tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
	//tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
	//tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params
	
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf("MSIE ");
	var a = document.createElement('a');
	a.filename= 'exported_table.xls';
	if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) // If Internet Explorer
	{
	txtArea1.document.open("txt/html","replace");
	txtArea1.document.write(tab_text);
	txtArea1.document.close();
	txtArea1.focus();
	sa=txtArea1.document.execCommand("SaveAs",true,"Report.xls");
	}
	else{ //other browser not tested on IE 11
	sa = 'data:application/vnd.ms-excel,' + encodeURIComponent(tab_text);
	newWindow=window.open(sa, 'Report.xls');
	}
	return (sa);
	});
 });
	
function chkResource(){
	if(document.getElementById("radio").checked==true){
		tbl_report();
	}else{
		tbl_view();
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
		<form action="report.php" name="rptpage" method="post" accept-charset=utf-8>
			<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="9" style="text-align:left">Reports</th>
				<tr>
				<div class="Error" align="center" id="errmsg"></div>
				 <td width="10%" nowrap="nowrap">Select Month & Year:</td>
				 <td width="21%">
					<select id="month" name="month" onchange="return chkResource();">
					{foreach key=k item=v from=$months}	
					<option value='{$k}' {if $k eq $currentMonth}selected{/if}>{$v} </option>
 					{/foreach}
					</select>
					<select id="year" name="year" onchange="return chkResource();">	
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
               			<td style="text-align:right;"> 

	                	<input type="hidden" id="exportQuery" name="exportQuery" value="">
	                	<input type="hidden" id="reportType" name="reportType" value="Transactions">
	                	<button id="exportBtn" class="btn btn-lg btn-warning custom-btn-01 hover_effect pull-right pull-right-to-left">Export to CSV</button>

</td>
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
