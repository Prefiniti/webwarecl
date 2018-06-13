<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Edit Company</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="getCompanyCustomers" datasource="#session.datasource#">
		SELECT * FROM users WHERE company=#url.id#
	</cfquery>
	<cfquery name="getCompanyInfo" datasource="#session.datasource#">
		SELECT * FROM companies WHERE id=#url.id#
	</cfquery>
	<table width="800" class="midTable" align="center">
		<tr>
			<td>
				<div class="sidebarBlock">
					<table width="100%">
						<tr>
							<th>Company Profile</th>
						</tr>
						<tr>
							<td>
							<cfoutput>
								<img src="graphics/group.png" align="absmiddle" /> #getCompanyCustomers.RecordCount# accounts for #getCompanyInfo.name#
							</cfoutput>
							</td>
						</tr>
						
						
					</table>
				</div>
				
				<div class="orderListBlock">
					<cfoutput>
					<form name="editCompany" method="post" action="editcompany_sub.cfm">
					<input type="hidden" name="id" value="#getCompanyInfo.id#" />
					<table width="100%">
						<tr>
							<th colspan="2">Company Information</th>
						</tr>
						<tr>
							<td>Name:</td>
							<td><input name="name" type="text" value="#getCompanyInfo.name#" size="40" /></td>
						</tr>
						<tr>
							<td>Address:</td>
							<td><textarea name="address" cols="40">#getCompanyInfo.mailing_address#</textarea></td>
						</tr>
						<tr>
							<td align="right" colspan="2"><input type="submit" class="normalButton" name="Submit" value="Save Changes" />							</td>
					</table>
					</form>
					</cfoutput>
					
					<table width="100%">
						<tr>
							<th>Accounts for <cfoutput>#getCompanyInfo.name#</cfoutput></th>
						</tr>
						<cfoutput query="getCompanyCustomers">
							<tr>
								<td><a href="editAccount.cfm?id=#id#">#longName#</a></td>
							</tr>
						</cfoutput>
						
					</table>
				</div>
				
			</td>
		</tr>
	</table>
</body>
</html>
