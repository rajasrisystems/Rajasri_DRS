<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
{literal}
<script>
function tbl_view(){
	document.getElementById("report").style.display = "none";
	document.getElementById("mgrid").style.display = "block";
	}
function tbl_report(){
	document.getElementById("report").style.display = "block";
	document.getElementById("mgrid").style.display = "none";
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
				<form action="report.php">
				<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="9" style="text-align:left">Reports</th> 	<!-- <select	width="10%"> -->
				<tr>
				 <td width="10%" nowrap="nowrap">Select Month & Year:</td>
				 <td width="21%">
				 		{html_select_date display_days=false end_year='+14}					
				</td>
				<td width="10%" nowrap="nowrap" style="text-align:right;">Resource:</td>
				<td width="5%"><input type = "radio" id="rdo2" value ="" name = "radio" onclick="tbl_report()" checked>
	               <span style="text-align:right" width="6%"valign="top">All</span>
	            </td>
               <td width="21%"><input type = "radio" id="rdo1" value ="" name = "radio" onclick="tbl_view()">
	             <span style="text-align:left;" width="10%" valign="top" nowrap="nowrap">Individual</span>

	             <select id="res" name="res" style="width: 120px;"> 
		         <option value="">--Select--</option>
			 {foreach item=res from=$resdata}<p><option value='{$res.Id}'>{$res.ResourceInitial}</option></p>	     				 {/foreach}
	             </select>
	           </td>
               <td style="text-align:right;"> <a href="#" style ="color:blue;"><img src="img/pdf.png" width="20px">&nbsp;Export to PDF</a>  </td>
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
			<tr>
				<td style="text-align:center;">1</td>
				<td>01/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
			</tr>
			<tr>
				<td style="text-align:center;">2</td>
				<td>02/07/2016</td>
				<td>40</td>
				<td>90</td>
				<td style="text-align:left;">Met deadlines</td>
			</tr>
			<tr>
				<td style="text-align:center;">3</td>
				<td>03/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"> </td>
			</tr>
			<tr>
				
				<td style="text-align:center;">4</td>
				<td>04/07/2016</td>
				<td>40</td>
				<td>90</td>
				<td style="text-align:left;">Ask good questions to client</td>
			</tr>	
			<tr>
				<td style="text-align:center;">5</td>
				<td>05/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
			</tr>
			<tr>
				<td style="text-align:center;">6</td>
				<td>06/07/2016</td>
				<td>40</td>
				<td>90</td>
				<td style="text-align:left;">Met deadlines</td>
			</tr>
			<tr>
				<td style="text-align:center;">7</td>
				<td>07/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"> </td>
			</tr>
			<tr>
				
				<td style="text-align:center;">8</td>
				<td>08/07/2016</td>
				<td>70</td>
				<td>120</td>
				<td style="text-align:left;">Great job! - note from client</td>
			</tr>
			<tr>
				<td style="text-align:center;">9</td>
				<td>09/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
			</tr>
			<tr>
				<td style="text-align:center;">10</td>
				<td>10/07/2016</td>
				<td>50</td>
				<td>100</td>
				<td style="text-align:left;">Good job note from client</td>
			</tr>
			<tr>
				<td style="text-align:center;">11</td>
				<td>11/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"> </td>
			</tr>
			<tr>
				
				<td style="text-align:center;">12</td>
				<td>12/07/2016</td>
				<td>50</td>
				<td>100</td>
				<td style="text-align:left;">Good job note from client</td>
			</tr>
			<tr>
				
				<td style="text-align:center;">13</td>
				<td>13/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
				
			</tr>
			<tr>
			
				<td style="text-align:center;">14</td>
				<td>14/07/2016</td>
				<td>50</td>
				<td>100</td>
				<td style="text-align:left;">Good job note from client</td>
				
			</tr>
			<tr>
				
				<td style="text-align:center;">15</td>
				<td>15/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"> </td>
							</tr>
			<tr>
				
				<td style="text-align:center;">16</td>
				<td>16/07/2016</td>
				<td>70</td>
				<td>120</td>
				<td style="text-align:left;">Great job! - note from client</td>
			</tr>
			<tr>
				
				<td style="text-align:center;">17</td>
				<td>17/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
				
			</tr>
			<tr>
			
				<td style="text-align:center;">18</td>
				<td>18/07/2016</td>
				<td>70</td>
				<td>120</td>
				<td style="text-align:left;">Great job! - note from client</td>
				
			</tr>
			<tr>
				
				<td style="text-align:center;">19</td>
				<td>19/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"> </td>
							</tr>
			<tr>
				
				<td style="text-align:center;">20</td>
				<td>20/07/2016</td>
				<td>-40</td>
				<td>10</td>
				<td style="text-align:left;">Failure to respond to client in time</td>
			</tr>
			<tr>
				
				<td style="text-align:center;">21</td>
				<td>21/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
				
			</tr>
			<tr>
			
				<td style="text-align:center;">22</td>
				<td>22/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
				
			</tr>
			<tr>
				
				<td style="text-align:center;">23</td>
				<td>23/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"> </td>
							</tr>
			<tr>
				
				<td style="text-align:center;">24</td>
				<td>24/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
			</tr>
			<tr>
				
				<td style="text-align:center;">25</td>
				<td>25/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
				
			</tr>
			<tr>
			
				<td style="text-align:center;">26</td>
				<td>26/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
				
			</tr>
			<tr>
				
				<td style="text-align:center;">27</td>
				<td>27/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"> </td>
							</tr>
			<tr>
				
				<td style="text-align:center;">28</td>
				<td>28/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
			</tr>
			<tr>
				
				<td style="text-align:center;">29</td>
				<td>29/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
				
			</tr>
			<tr>
			
				<td style="text-align:center;">30</td>
				<td>30/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"></td>
				
			</tr>
			<tr>
				
				<td style="text-align:center;">31</td>
				<td>31/07/2016</td>
				<td> </td>
				<td>50</td>
				<td style="text-align:left;"> </td>
			</tr>
			<tr>
				
				<td style="text-align:center;"></td>
				<td style="font-size:14px;"><b>Average</b></td>
				<td></td>
				<td style="font-size:14px;"><b>64.19</b></td>
				<td></td>
			</tr>
			
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
			<tr>
				<td>1</td>
				<td>HS</td>
				<td>50</td>
				<td>50</td>
			</tr>
			<tr>
				<td>2</td>
				<td>MA</td>
				<td>70</td>
				<td>79</td>
			</tr>
			<tr>
				<td>3</td>
				<td>CK</td>
				<td>61</td>
				<td>59</td>
			</tr>
		</table>
	</div>
 </div>
</div>
</div>	
</body>
</html>
