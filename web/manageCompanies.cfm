<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Companies</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="GetCompanies" datasource="#session.datasource#">
		SELECT * FROM companies ORDER BY name
	</cfquery>
	
	<table width="900" class="midTable" align="left">
		<tr>
			<td>
				<div class="sidebarBlock">
					<table width="100%">
						<tr>
							<th>Manage Companies</th>
						</tr>
						<tr>
							<td><img src="graphics/user_add.png" align="absmiddle" /> <a href="addCompany.cfm">Add Company</a></td>
						</tr>
						<tr>
							<td><img src="graphics/user_edit.png" align="absmiddle" /> <a href="manageCustomers.cfm">Edit Accounts</a></td>
						</tr>
						
					</table>
				</div>
				
				<div class="orderListBlock">
				 	<table width="100%">
						<tr>
							<th >Companies</th>
						</tr>
					
						<cfoutput query="GetCompanies">
							<tr>
								<td><a href="editCompany.cfm?id=#id#">#name#</a></td>
							</tr>
						</cfoutput>
					</table>
			    </div>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>
