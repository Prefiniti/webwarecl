<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Browse Files</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #FFFFFF;
background-color:#666666;}
.style3 {color: #FFFFFF; background-color: #666666; font-weight: bold; }
-->
</style>
</head>

<body>
	<cfmodule template="/authentication/components/checkLogin.cfm" loggedIn="#session.loggedin#" redirPage="#cgi.script_name#?#cgi.QUERY_STRING#">
	<cfquery name="f" datasource="#session.datasource#">
		SELECT * FROM files WHERE projectID='#url.id#'
	</cfquery>
	
	<cfquery name="p" datasource="#session.datasource#">
		SELECT * FROM projects WHERE id='#url.id#'
	</cfquery>
	
	<cfquery name="pSel" datasource="#session.datasource#">
		SELECT * FROM projects WHERE clientID='#session.userid#' ORDER BY duedate DESC
	</cfquery>
	
	<cfparam name="RowNum" default="0">
	<cfparam name="ColOdd" default="">
	<cfparam name="ColColor" default="white">
	<cfparam name="addressString" default="">
	<cfset addressString="#p.address#,#p.city#,#p.state#,#p.zip#">
	<div class="sidebarBlock" style="height:auto;">
		<table width="100%">
			<tr>
				<th colspan="2">Project Overview</th>
			</tr>
			<tr>
				<td colspan="2"><cfoutput><img src="/graphics/map_go.png" align="middle" /> <a href="javascript:getMap('tcTarget', '#addressString#', '<strong>Center Line Services</strong><br>Project ###p.clsJobNumber#<br><br>#p.address#<br>#p.city#, #p.state#  #p.zip#<br><br><a href=browsefiles.cfm?id=#url.id#>Return to Project View</a>');">View project location on map</a></cfoutput></td>
			<tr>
				<td>Jump to:</td>
				<td>
					<select name="proj" id="proj">
						<cfoutput query="pSel">
							<option value="#id#" <cfif #id# EQ #url.id#>checked</cfif>>#description#</option>
						</cfoutput>
					</select>
					<a href="javascript:location.replace('browsefiles.cfm?id=' + GetValue('proj'))"><img src="graphics/arrow_right.png" border="0" align="top" /></a>
				</td>
			</tr>
			
					
		</table>
		<cfmodule template="/MyCL/components/Collapse.cfm" DivName="searchBar" HeaderText="Project Locator" InitialState="inline" URL="/search/components/search.cfm" SideImage="zoom.png">
	</div>
	<div id="tabBars" class="tabBar">
						<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();">Browse Project Files</a></span>
						
					</div>
	<div class="orderListBlock" id="tcTarget">
	<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">View Project</h3>
	<cfoutput query="p">
	
	<table width="100%" cellspacing="0">
	
		<tr>
			<td class="style1"><span class="style3">Project Description</span></td>
		    <td class="style1"><span class="style1">#description#</span></td>
		</tr>
		<tr>
			<td class="style1"><span class="style3">Your Project Number</span></td>
		    <td class="style1"><span class="style1">#clientJobNumber#</span></td>
		</tr>
		<tr>
			<td class="style1"><span class="style3">Center Line Services Project Number</span></td>
		    <td class="style1"><span class="style1">#clsJobNumber#</span></td>
		</tr>
		<tr>
			<td class="style1"><span class="style3">Project Status</span></td>
			<td class="style1">	<cfswitch expression="#status#">
						<cfcase value="0">
						<span class="style1">							Incomplete						</span>
						</cfcase>
						<cfcase value="1">
						<span class="style1">							Complete						</span>
						</cfcase>
		  </cfswitch>			</td>
		</tr>
	</table>
	</cfoutput>
	<table width="100%">
		<tr>
			<td height="40">
				<table width="100%" cellspacing="0">
					<tr>
						<th align="left">File Description</th>
						<th align="left">Upload Date</th>
						<th align="left">Tools</th>
					</tr>
					<cfoutput query="f">
					<cfset RowNum=RowNum + 1>
					<cfset ColOdd=RowNum mod 2>
					
					<cfswitch expression="#ColOdd#">
						<cfcase value=1>
							<cfset ColColor="silver">
						</cfcase>
						<cfcase value=0>
							<cfset ColColor="white">
						</cfcase>
					</cfswitch>
					<tr>
						<td style="background-color:#ColColor#; padding:3px;">#longName#</td>
						<td style="background-color:#ColColor#; padding:3px;">#DateFormat(uploadDateTime, "mm/dd/yyyy")# #TimeFormat(uploadDateTime, "h:mm tt")#</td>
						<td style="background-color:#ColColor#; padding:3px;">
							<a href="javascript:viewFile('/datastore/projectfiles/#filePath#')"><img src="/graphics/zoom.png" border="0" align="middle"/></a> <a href="javascript:viewFile('/datastore/projectfiles/#filePath#')">View File</a>
					</tr>
					</cfoutput>
				</table>
		  </td>
		</tr>
	</table>
	</div>
</body>
</html>
