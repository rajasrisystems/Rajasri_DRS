{literal}
<script type="text/javascript">
function validate_ad()
{
	if(document.getElementById('ad_txt').value == "")
	{
		document.getElementById('errmsg1').innerHTML = 'Enter the user name!';
		document.getElementById('ad_txt').focus();
		return false;
	}
	if(document.getElementById('ad_pass').value =="")
	{
		document.getElementById('errmsg1').innerHTML = 'Enter password!';
		document.getElementById('ad_pass').focus();
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
		<h1>Admin</h1>
		<div class="breadcrumbs"><a href="controlpanel.php" >Homepage</a> >> Admin Management</div>
		</div>
		<br/>
		<div class = "manage-grid">
		<div class="Error" align="center" id="errmsg">{$ErrorMessage}</div>
		<div class="success" align="center" id="errmsg">{$SuccessMessage}</div>
			<div class="report-page" style="text-align:left;">
				<form action="" name="rptpage" method="post" onsubmit ="return validate_ad();">
				<input type="hidden" id="hdAction" name="hdAction" value="">
				<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="9" style="text-align:left">Admin</th>
			<tr>
				<div class="Error" align="center" id="errmsg1"></div>
				 
				<!---- User Name Name Text Box ---->
				<td width="10%" nowrap="nowrap" style="text-align:right;">New User:</td>
				<td width="5%"><input type ="text" id="ad_txt" name = "Admin_name" ></td>
				
				<!---- Password Text ---->
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">Password:</td>
				<td width="5%"><input type ="password" id="ad_pass" name = "Admin_password" ></td>
				
				<!---- Submit Button ---->
				
				<td width="10%" nowrap="nowrap" style="text-align:right;"></td>
				<td width="5%"><input type ="submit" id="rs_btn" name = "admin_button" value="Submit"></td>
				
				<!---<td width="10%" nowrap="nowrap" style="text-align:right;"></td>
				<td width="5%"><input type ="submit" id="rs_btn" name = "Show_db" value="show Database"></td>
				-->
			</tr>
		</table>
	         
	         
	         
			 </form>
	      </div>	  
		</div>
</div>

