{literal}
<script type="text/javascript">
function validate_rs()
{
	if(document.getElementById('rs_txt').value == "")
	{
		document.getElementById('errmsg1').innerHTML = 'Enter resource name!';
		document.getElementById('rs_txt').focus();
		return false;
	}
	if(document.getElementById('rs_ini').value =="")
	{
		document.getElementById('errmsg1').innerHTML = 'Enter resource initials!';
		document.getElementById('rs_ini').focus();
		return false;
	}
	document.getElementById("hdAction").value='1';
	return true;
	
}
</script>
{/literal}
<div id="middle"> 
  <div id="center-column">
    <div class="top-bar-header">
		<h1>Resource</h1>
		<div class="breadcrumbs"><a href="controlpanel.php" >Homepage</a> >> Resource Management</div>
		</div>
		<br/>
		<div class = "manage-grid">
		<div class="Error" align="center" id="errmsg">{$ErrorMessage}</div>
		<div class="success" align="center" id="errmsg">{$SuccessMessage}</div>
			<div class="report-page" style="text-align:left;">
				<form action="" name="rptpage" method="post" onsubmit ="return validate_rs();">
				<input type="hidden" id="hdAction" name="hdAction" value="">
				<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="9" style="text-align:left">Resource</th>
				<tr>
				<div class="Error" align="center" id="errmsg1"></div>
				 
				<!---- Resource Name Text Box ---->
				<td width="10%" nowrap="nowrap" style="text-align:right;">Resource Name:</td>
				<td width="5%"><input type ="text" id="rs_txt" name = "resource_text" ></td>
				
				<!---- Resource Initial Text ---->
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">Resource Initial:</td>
				<td width="5%"><input type ="text" id="rs_ini" name = "resource_initial" ></td>
				
				<!---- Submit Button ---->
				
				<td width="10%" nowrap="nowrap" style="text-align:right;"></td>
				<td width="5%"><input type ="submit" id="rs_btn" name = "resource_button" value="Submit"></td>

               
	         </tr>
	         
	         </table>
			 </form>
	      </div>	  
		</div>
</div>

