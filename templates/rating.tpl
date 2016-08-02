<html>
<head>
	{literal}
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
 	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="css/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script>
	$( function() {$( "#ratingdate" ).datepicker({dateFormat:"dd/mm/yy"});});
	jQuery(document).ready(function($){
	$("#code").autocomplete({
	source: function(request, response) {
	$.ajax({
		url: "get_code.php",
	        data: {  term: $("#code").val()},
	        dataType: "json",
	        type: "GET",
	        success: function(data){response(data);}
		      });},scroll:true
		});
	});
	function validfield()
	{
		if(document.getElementById('ratingdate').value=='')
		{
		document.getElementById('errmsg').innerHTML='Please select date';
		document.getElementById('ratingdate').focus();
		return false;
		}
		if(document.getElementById('resource').value=='')
		{
		document.getElementById('errmsg').innerHTML='Please select resource';
		document.getElementById('resource').focus();
		return false;
		}
		if(document.getElementById('code').value=='')
		{
			
		document.getElementById('errmsg').innerHTML='Please enter code';
		document.getElementById('code').focus();
		return false;
		}
		if(document.getElementById('RatId').value=='')
		{
		document.getElementById('Hitaction').value=1;
		}
		else
		{
			document.getElementById('update_rating').value=1;	
		}	
	}
	function myFunction() 
	{
		var x;
		if (confirm("Are you sure you want to deletethis record?") ) 
		{
			return true;
		}
		else 
		{
			return false; 		
	   	}
	}
	</script>
	{/literal}
</head>
<body>
<div id="wrapper">
<div style="clear:both;"></div>
<div id="middle"> 
  <div id="center-column">
    <div class="top-bar-header">
      <h1>Rating</h1>
      <div class="breadcrumbs"><a href="controlpanel.php" >Homepage</a> >> Rating</div>
    </div>
    <br/>
    	<div class="manage-grid">
		<form name="rating_form" id="rating_form" method="post" onsubmit="return validfield(this);">
			<input type="hidden" name="Hitaction" id="Hitaction">
			<input type="hidden" name="RatId" id="RatId" value="{$smarty.request.Rat_Id}">
			<input type="hidden" name="update_rating" id="update_rating" >
			<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="8" style="text-align:left">Rating</th>
				<tr> 
				<td style="border-bottom:none;" colspan="8"> <div class="Error" align="center" id="errmsg"></div>
					<div class="success">{if $smarty.request.successmsg eq 3} User data added successfully {/if}
					</div>
					<div class="success">{if $smarty.request.successmsg eq 1} User data updated successfully {/if}
					</div>
					<div class="success">{if $smarty.request.successmsg eq 2}User data deleted successfully {/if}
					</div>
				</td>
				</tr>
				<tr style="border-bottom:none;">
					<td style="text-align:right;border-bottom:none;" width="10%" valign="top" nowrap="nowrap">Rating Date:</td>
					<td style="text-align:left;border-bottom:none;" width="10%"valign="top">
						<input type="text" name="ratingdate" id="ratingdate" size="12" readonly="readonly" value="{$getRating.0.RatingDate|date_format:'%d/%m/%Y'}">
					</td>
					<td style="text-align:right;border-bottom:none;" width="10%"valign="top">Resource:</td>
					<td style="text-align:left;border-bottom:none;" width="5%"valign="top"> 
					<select id="resource" name="resource" style="width: 120px;">
						<option value="">--Select--</option>
						{foreach item=resource from=$data}<p><option value='{$resource.ID}' {if $getRating.0.ResourceID eq $resource.ID} selected="selected" {/if}>{$resource.ResourceInitial}</option></p>
						{/foreach}	
					</select>
					</td>
					<td style="text-align:right;border-bottom:none;" width="10%"valign="top">Code:</td>
					<td style="text-align:left;border-bottom:none;" width="10%"valign="top">
						<input type="text" id="code" name="code" style="width: 250px;" value="{$getRating.0.Code}">
	                        	</td>
					<td style="text-align:right;border-bottom:none; vertical-align:top">Notes:</td>
					<td style="text-align:left;border-bottom:none;">
						<textarea rows="3" cols="40" name="notes">{if $getRating.0.Notes neq '-'}{$getRating.0.Notes}{else} {/if}</textarea>
					</td>
					<tr style="border-bottom:none;">
					<td colspan="8"> 		
	 					<input type=submit name="submit1" value="Submit"> 
					</td></tr>
				</tr>
			</table>
		</form>
		<div class="submit"></div>
	 	<form name="del_form" id="del_form" method="post" >
		<input type="hidden" name="delaction" id="delaction">
		<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
			<th colspan="6" style="text-align:left"> Report </th>
			<tr>&nbsp;</tr>
			<th width="8%">S.No.</th>
			<th width="8%">Resource</th>
			<th width="12%">Code</th>
			<th> Notes </th>
			<th width="12%">Action</th> 
			{assign var=number value=1}
			  {section name=i loop=$displaydet}
			<tr>
				<td>{$number++}</td>
				<td>{$displaydet[i].ResourceInitial}</td>
				<td>{$displaydet[i].Code}</td>
				<td  style="text-align:left">{if $displaydet[i].Notes neq ''}{$displaydet[i].Notes}{else} - {/if} </td>
				<td style="padding:8px"><a href="#">
				<a href="rating.php?Rat_Id={$displaydet[i].RatingID}"> <img src="img/b_edit.png"></a>&nbsp;&nbsp;
				<a href="drop.php?Del_Id={$displaydet[i].RatingID}"><img src="img/b_drop.png" onclick="return myFunction();" ></a>
				<input type="hidden" name="delvar" id="delvar" value="{$displaydet[i].RatingID}">
				</td>
			</tr>
			 {sectionelse}
				 <tr><td colspan="5">No records found</td></tr>
			 {/section}
		</table>
		</form>
		<div class="submit"></div>
	</div>
  </div>
</div>
</div>	
</body>
</html>
