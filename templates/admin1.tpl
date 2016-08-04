{literal}
<script type="text/javascript">
function validate_rs()
{
	if(document.getElementById('rs_txt').value == "")
	{
		
		document.getElementById('errmsg1').innerHTML = 'Please enter resource name!';
		document.getElementById('rs_txt').focus();
		return false;
	}
	if(document.getElementById('rs_ini').value =="")
	{
		document.getElementById('errmsg1').innerHTML = 'Please enter resource initials!';
		document.getElementById('rs_ini').focus();
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
				<form action="" name="rptpage" method="post" onsubmit ="return validate_rs();">
				<input type="hidden" id="hdAction" name="hdAction" value="">
				<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="9" style="text-align:left">Resource</th>
				<tr>
				<td style="border-bottom:none;" colspan="8">
					<div class="Error" align="center" id="errmsg1"></div>
					<div class="Error" align="center" id="errmsg1">{$ErrorMessage}</div>
					<div class="success" align="center" id="errmsg">{$SuccessMessage}</div>
					<div class="success">{if $smarty.request.successmsg eq 1} User data updated successfully {/if}</div>
					<div class="success">{if $smarty.request.successmsg eq 2}User data deleted successfully {/if}
				</td>
				</tr>
			<tr style="border-bottom:none;">
				
				 
				<!---- Resource Name Text Box ---->
				<td width="10%" nowrap="nowrap" style="text-align:right;">User Name:</td>
				<td width="5%"><input type ="text" id="rs_txt" name = "resource_text" value="{$adminDetails.0.Username}"></td>
				
				<!---- Resource Initial Text ---->
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">Password:</td>
				<td width="5%"><input type ="text" id="rs_ini" name = "resource_initial" value="{$adminDetails.0.Password}" ></td>
				
				<!---- Submit Button ---->
				
				<td width="10%" nowrap="nowrap" style="text-align:right;"></td>
				<td width="5%"><input type ="submit" id="rs_btn" name = "resource_button" value="Submit"></td>

               
	        </tr>
	        </table>
		<div id = "res_tbl" >	
			<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
				<!--- <th colspan="6" style="text-align:left"> Admin Username List </th> -->
				<tr>&nbsp;</tr>
					<th width="8%">S.No.</th>
					<th width="8%">Admin User</th>
				</tr>
					{assign var=number value=1}
					{section name=R loop=$showres}
				<tr>
					<td>{$number++}</td>
					<td>{$showres[R].ResourceName}</td>
					<td>{$showres[R].ResourceInitial}</td>
					<td style="padding:8px"><a href="#">
						<a href="resource.php?Rs_Id={$showval[U].ID}"> <img src="img/b_edit.png">{$showval[U].ID}</a>&nbsp;&nbsp;
						<a href="ad_drop.php?Del_Id={$showval[U].ID}"><img src="img/b_drop.png" onclick="return myFunction();" ></a>
							<input type="hidden" name="delvar" id="delvar" value="{$displaydet[i].RatingID}">
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

