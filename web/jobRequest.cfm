<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Request Job</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="calendar2.js"></script>
</head>

<body>
	<script language="javascript">
		function showDiv(which) 
		{
			document.getElementById(which).style.display="inline";
		}
		function hideDiv(which) 
		{
			document.getElementById(which).style.display="none";
		}
		function setValueLcl()
		{
			document.getElementById("subText").value=document.getElementById("subList").value;
		}
		function updateMap()
		{
			var addressString;
			addressString = GetValue('address') + ',' + GetValue('city') + ',' + GetValue('state') + ',' + GetValue('zip');
	
			getMapInline('inlineMap', addressString);
		}
	</script>
	<div class="sidebarBlock">
		<table width="100%">
			<tr>
				<th>Request Services</th>
			</tr>
			<tr>
				<td>
					<img src="graphics/application_home.png" align="absmiddle" /> <a href="home-redir.cfm" >Return to MyCL Home</a>
				</td>
			</tr>
		</table>
		
	</div>
	<div id="tabBars" class="tabBar">
						<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();">Request Services</a></span>
						
					</div>
	<div class="orderListBlock" id="tcTarget">
		
				<cfif #session.loggedin# EQ "no">
					<cflocation url="login.cfm" addtoken="no">
				</cfif>
				<cfquery name="qrySubs" datasource="centerline">
				SELECT DISTINCT subdivision FROM projects ORDER BY subdivision
				</cfquery>
				<cfquery name="qryUsers" datasource="centerline">
					SELECT id, longName FROM users ORDER BY longName
				</cfquery>
				<!---JOB ORDER FORM--->
				
				<form name="reqJob" action="job-submit.cfm" method="post">
					<input type="hidden" name="reqid" <cfoutput>value="#CreateUUID()#"</cfoutput>>
					<input type="hidden" name="status" value="0" />
					<cfswitch expression="#session.usertype#">
						<cfcase value="0">
							<cfoutput>
							<input type="hidden" name="clientID" value="#session.userid#" />
							Order to be placed on behalf of #session.longName#
							</cfoutput>
						</cfcase>
						<cfcase value="1">
							Place order on behalf of:
							<select name="clientID">
								<cfoutput query="qryUsers">
									<option value="#id#">#longName#</option>
								</cfoutput>
							</select>
						</cfcase>
						
					</cfswitch>
					
					
					<table width="100%">
						<tr>
						  <th colspan="4">Basic Order Information</th>
					  </tr>
						<tr>
							<td width="277">Job Name:</td>
						  <td colspan="3"><p>
						    <input type="text" name="description" /> 
						    <br /><font color="red">This field should be a short, easy-to-remember description of the job.</font></p></td>
						</tr>
						<tr>
							<td>Job Type:</td>
							<td colspan="3"><p>
							  <label>
							    <input type="radio" name="JobType" value="Improvement Survey - Meets & Bounds" />
							    Improvement Survey - Meets & Bounds</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Improvement Survey - Lot & Block" />
							    Improvement Survey - Lot & Block</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="ALTA/ACSM" />
							    ALTA/ACSM</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Construction Layout" />
							    Construction Layout</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Claim of Exemption" />
							    Claim of Exemption</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Plat of Survey" />
							    Plat of Survey</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Legal Description" />
							    Legal Description</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Survey Inspection Report" />
							    Survey Inspection Report</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Flood Certification" />
							    Flood Certification</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Topographic Survey" />
							    Topographic Survey</label>
							  <br />
							  <label>
							    <input type="radio" name="JobType" value="Aerial" />
							    Aerial</label>
							  <br />
							    <label>
							    <input type="radio" name="JobType" value="Other" />
							    Other</label>
							  <br />
						    </p></td>
						</tr>
						<tr>
							<td>Due Date:</td>
							<td colspan="3"><input type="text" name="duedate" id="duedate" readonly/> <a href="javascript:dueDateCal.popup();"><img src="graphics/date.png" border="0" /></a> (click the calendar icon to choose a date)</td>
						<tr>
						  <td>Street Address:</td>
						  <td colspan="3"><input type="text" name="address" id="address" onblur="calcLatLng(); updateMap();"/></td>
					  </tr>
						<tr>
							<td>City:</td>
							<td colspan="3"><input type="text" name="city" id="city" onblur="calcLatLng(); updateMap();"/></td>
						</tr>
						<tr>
							<td>State:</td>
							<td colspan="3"><input type="text" maxlength="2"  name="state" id="state" onblur="calcLatLng(); updateMap();"/></td>
						</tr>
						<tr>
							<td>ZIP Code: </td>
							<td colspan="3"><input type="text" maxlength="10"  name="zip" id="zip" onblur="calcLatLng(); updateMap();"/></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="3"><input type="button" class="normalButton" name="cc" onclick="calcLatLng(); updateMap();" value="Calculate Latitude/Longitude" /></td>
						</tr>
						<tr>
							<td>Latitude: </td>
							<td colspan="3"><input type="text" maxlength="10"  name="latitude" id="latitude" onchange="loadTRS();"/></td>
						</tr>
						<tr>
							<td>Longitude: </td>
							<td colspan="3"><input type="text" maxlength="10"  name="longitude" id="longitude" onchange="loadTRS();"/></td>
						</tr>
						<tr>
							<td>Map:</td>
							<td colspan="3"><div id="inlineMap" style="width:350px; height:200px; border:solid 1px silver">
							</div>							</td>
						<tr>
							<td>Subdivision:</td>
						  <td colspan="3">
						  	<select name="subSelect" size="5" onchange="setValueLcl();" id="subList">
						  		<cfoutput query="qrySubs">
									<option value="#subdivision#">#subdivision#</option>
								</cfoutput>
						    </select><br />
							<div id="2" style="display:inline">
							<a href="#" onclick="showDiv(1); hideDiv(2); showDiv(3); return false;">Add New Subdivision</a>							</div>
							<div id="3" style="display:none">
							<a href="#" onclick="showDiv(2); hideDiv(1); hideDiv(3); return false;">Use Existing Subdivision</a>							</div>
							<div id="1" style="display:none">
							<blockquote>
							<table width="400" border="1">
							<tr>
							<th>Add New Subdivision</th>
							</tr>
							<tr>
							<td style="background-color:#CCCCCC">
							<br />New Subdivision Name:	<input name="subdivision" type="text" size="30" id="subText"/>							</td>
							</tr>
							</table>
							</blockquote>
							</div>						  </td>
						</tr>
						<tr>
							<td>Lot:</td>
							<td colspan="3"><input type="text" name="lot" /> </td>
						</tr>
						<tr>
							<td>Block:</td>
							<td colspan="3"><input type="text" name="block" /></td>
						</tr>
						<tr>
							<td>Section:</td>
							<td colspan="3"><input type="text" name="section" id="section"/></td>
						</tr>
						<tr>
							<td>Township:</td>
							<td colspan="3"><input type="Text" name="township" id="township" /></td>
						</tr>
						<tr>
							<td>Range:</td>
							<td colspan="3"><input type="text" name="range" id="range"/></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="3"><input type="button" class="normalButton" value="Calculate Section/Township/Range" onclick="loadTRS();" /></td>
						</tr>
						<tr>
						  <th colspan="4">Filing Information</th>
					  </tr>
					    <tr>
					      <td>Filing Type:</td>
						  <td width="231"><p>
						    <label>
						      <input type="radio" name="SubdivisionOrDeed" value="Subdivision" />
						      Subdivision</label>
						    <br />
						    <label>
						      <input type="radio" name="SubdivisionOrDeed" value="Deed" checked />
						      Deed</label>
						    <br />
					      </p></td>
				          <td width="115"> <p>
				      <label>
				        <input type="radio" name="FilingType" value="Plat" />
				        Plat</label>
				      <br />
				      <label>
				        <input type="radio" name="FilingType" value="Cabinet" />
				        Cabinet</label>
				      <br />
				      <label>
				        <input type="radio" name="FilingType" value="Book" checked/>
				        Book</label>
				      <br />
			      </p></td>
				          <td width="226"><input type="text" name="PlatCabinetBook" /></td>
				      </tr>
					  <tr>
					      <td></td>
						  <td width="231" colspan="2"><p>
						    <label>
						      <input type="radio" name="PageOrSlide" value="Page" checked/>
						      Page</label>
						    <br />
						    <label>
						      <input type="radio" name="PageOrSlide" value="Slide" />
						      Slide</label>
						    <br />
						    </p></td>
				          <td width="226"><input type="text" name="PageSlide" /></td>
				      </tr>
					  <tr>
					    <td>Reception or Document Number: </td>
					    <td colspan="3"><input name="ReceptionNumber" type="text" id="ReceptionNumber" /></td>
				      </tr>
					  <tr>
					    <td>Filing Date: </td>
					    <td colspan="3"><input name="FilingDate" type="text" id="FilingDate" /> <a href="javascript:filingDateCal.popup();"><img src="graphics/date.png" border="0" /></a> (click the calendar icon to choose a date)<br />Hint:  You can manually edit any date entered in this field.</td>
				      </tr>
				      <tr>
						  <th colspan="4">Job Information</th>
					  </tr>
						<tr>
						  <td>Certified To: </td>
						  <td colspan="3"><input name="CertifiedTo" type="text" id="CertifiedTo" size="50" /> 
						    <font color="red">(i.e. last name of client)</font> </td>
					  </tr>
						<tr>
							<td>Other Job Information (description of work, special instructions, etc.):</td>
							<td colspan="3"><textarea name="specialinstructions" rows="5" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>Your Job Number:</td>
							<td colspan="3"><input type="text" name="clientJobNumber" /></td>
						</tr>
						<tr>
						  <td>Publication options: </td>
						  <td colspan="3"><p>
						    <label>
						      <input type="radio" name="allow_publication" value="1"/>
						      Allow us to publish this order in our site news</label>
						    <br />
						    <label>
						      <input type="radio" name="allow_publication" value="0" checked />
						      Keep this order private</label>
						    <br />
					      </p></td>
					  </tr>
						<!--- <tr>
							<td>Attach File:</td>
							<td><input type="file" name="fileattach" /></td>
						</tr> --->
						<tr>
							<td>Submit As:</td>
							<td><p>
							  <label>
							    <input type="radio" name="submitAs" value="bid" />
							    Request for Bid</label>
							  <br />
							  <label>
							    <input type="radio" name="submitAs" value="order" checked/>
							    Place Order</label>
							  <br />
						    </p></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="3" align="right"><input type="submit" class="normalButton" name="Submit" value="Submit Job" /></td>
						</tr>
					</table>
				  
				</form>
				<script language="javascript">
					var dueDateCal = new calendar2(document.forms['reqJob'].elements['duedate']);
					var filingDateCal = new calendar2(document.forms['reqJob'].elements['FilingDate']);
				</script>

	</div>
	
	
</body>
</html>
