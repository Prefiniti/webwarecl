<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Profile Manager</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfparam name="RowNum" default="0">
	<cfparam name="ColOdd" default="">
	<cfparam name="ColColor" default="white">
	
	<cfquery name="gUsers" datasource="#session.datasource#">
		SELECT * FROM users ORDER BY type DESC, longName ASC
	</cfquery>
	
	<cfquery name="gCompanies" datasource="#session.datasource#">
		SELECT * FROM companies ORDER BY name ASC
	</cfquery>
	
	<div class="sidebarBlock" style="height:auto">
		<table width="100%">
			<tr>
				<th>Profile Manager</th>
			</tr>
			<tr>
				<td><img src="graphics/user_add.png" align="absmiddle" /> <a href="javascript:addUser();">Add User Account</a></td>
			</tr>
			<tr>
				<td><img src="graphics/group_add.png" align="absmiddle"  /> <a href="javascript:addCompany();">Add Company</a></td>
			</tr>
			
			</table>
			<div style="overflow:scroll; height:300px; margin:3px;">
				<table width="100%" cellspacing="0">
						<tr>
							<th colspan="2">Companies</th>
						</tr>
						<cfoutput query="gCompanies">
						<tr>
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
						
						<td style="background-color:#ColColor#">#name#</td>
						<td style="background-color:#ColColor#" align="right"><a href="javascript:editCompany('#id#');"><img src="graphics/building_edit.png" border="0" align="absmiddle"/></a> <a href="javascript:deleteCompany('#id#');"><img src="graphics/building_delete.png" border="0" align="absmiddle" /></a>
						</tr>
						</cfoutput>
						<cfset RowNum="0">
						<cfset ColOdd="">
						<tr>
							<th colspan="2">Individual users./th>
						</tr>
						<cfoutput query="gUsers">
						<tr>
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
						
						<td style="background-color:#ColColor#">#longName#</td>
						<td style="background-color:#ColColor#" align="right"><a href="javascript:editUser('#id#');"><img src="graphics/user_edit.png" border="0" align="absmiddle"/></a> <a href="javascript:deleteUser('#id#');"><img src="graphics/user_delete.png" border="0" align="absmiddle" /></a>
						</tr>
						</cfoutput>
				</table>
			</div>
		</table>
	</div>
	
	<div class="tabBar">
		<span class="tabButtonActive" style="color:black;">Profile Details</span>
	</div>
	
	<div class="orderListBlock" id="tcTarget">
		<table width="100%">
			<tr>
				<td align="center">
					<h3>Select a user from the sidebar on the left.</h3>
					
					<p class="VPLink">Profile Manager</p>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
