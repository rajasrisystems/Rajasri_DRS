{literal}
<script type="text/javascript">
function validate_rs()
{
	if(document.getElementById('ad_txt').value == "")
	{
		
		document.getElementById('errmsg1').innerHTML = 'Please enter username!';
		document.getElementById('ad_txt').focus();
		return false;
	}
	if(document.getElementById('ad_pass').value =="")
	{
		document.getElementById('errmsg1').innerHTML = 'Please enter password!';
		document.getElementById('ad_pass').focus();
		return false;
	}
	document.getElementById("hdAction").value='1';
	return true;
}
function myFunction() 
	{
		var x;
		if (confirm("Are you sure! you want to delete this record?") ) 
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
<div id="middle"> 
  <div id="center-column">
    <div class="top-bar-header">
		<h1>Resource</h1>
		<div class="breadcrumbs"><a href="controlpanel.php" >Homepage</a> >> Admin Management</div>
		</div>
		<br/>
		<div class = "manage-grid">
		
		
			<div class="report-page" style="text-align:left;">
				<form action="" name="rptpage" method="post" onsubmit="return validate_rs()">
				<input type="hidden" id="hdAction" name="hdAction" value="">
				<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="9" style="text-align:left">Resource</th>
				<tr>
				<td style="border-bottom:none;" colspan="8">
					<div class="Error" align="center" id="errmsg1"></div>
					<div class="Error" align="center" id="errmsg1">{$ErrorMessage}</div>
					<div class="success" align="center" id="errmsg">{$SuccessMessage}</div>
					<div class="success">{if $smarty.request.successmsg eq 1} User data updated successfully {/if} {if $smarty.request.successmsg eq 2}User data deleted successfully {/if}</div>
									</td>
				</tr>
			<tr style="border-bottom:none;">
				
				 
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">User Name:</td>
				<td width="5%"><input type ="text" id="ad_txt" name = "admin_text" value="{$adminDetails.0.Username}"></td>
				
				
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">Password:</td>
				<td width="5%"><input type ="password" id="ad_pass" name = "admin_password" value="{$adminDetails.0.Password}" ></td>
				
				
				
				<td width="10%" nowrap="nowrap" style="text-align:right;"></td>
				<td width="5%"><input type ="submit" id="rs_btn" name = "admin_button" value="Submit" ></td>

               
	        </tr>
	        </table>
		<div id = "res_tbl" >	
			<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
				<!--- <th colspan="6" style="text-align:left"> Admin Username List </th> -->
				<tr>&nbsp;</tr>
					<th width="8%">S.No.</th>
					<th width="8%">Admin User</th>
					<th width="8%">Action</th>
				</tr>
					{assign var=number value=1}
					{section name=R loop=$showval}
				<tr>
					<td>{$number++}</td>
					<td>{$showval[R].Username}</td>
					<td style="padding:8px"><a href="#">
						<a href="admin.php?Ad_Id={$showval[R].ID}"> <img src="img/b_edit.png"></a>&nbsp;&nbsp;
						<a href="ad_drop.php?Del_Id={$showval[R].ID}"><img src="img/b_drop.png" onclick="return myFunction();" ></a>
							<!-- <input type="hidden" name="delvar" id="delvar" value="{$displaydet[i].RatingID}"> -->
					</td>
				</tr>
					{sectionelse}
					<tr>
						<td colspan="3">No Records Found</td>
					</tr>
					{/section}
			</table>
		</div>
			 </form>
	      </div>	  
		</div>
</div>

