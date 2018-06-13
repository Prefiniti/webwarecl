<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Edit Account</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
<cfquery name="accountInfo" datasource="#session.datasource#">
	SELECT * FROM users WHERE id=#URL.id#
</cfquery>

<cfquery name="getCompanies" datasource="#session.datasource#">
	SELECT * FROM companies
</cfquery>

<cfquery name="getCompanyName" datasource="#session.datasource#">
	SELECT * FROM companies WHERE id=#accountInfo.company#
</cfquery>

<center>
<form name="editAccount" action="editAcct_post.cfm" method="post">
<cfoutput><input type="hidden" name="id" value="#URL.id#"/></cfoutput>
	<table width="800" class="midTable">
		<tr>
			<th colspan="2">Edit Account</th>
		</tr>
		<tr>
			<td>Company:</td>
			<td>
				<select name="company" >
					<cfoutput>
						<option value="#accountInfo.company#">#getCompanyName.name#</option>
					</cfoutput>
					<cfoutput query="getCompanies">
						<option value="#id#">#name#</option>
					</cfoutput>	
				</select>
			</td>
		</tr>
		<tr>
			<td>Name:</td>
			<td><cfoutput><input type="text" name="longName" value="#accountInfo.longName#"  /></cfoutput></td>
		</tr>
		<tr>
			<td>Account Class:</td>
			<td><p>
			  <label>
			    <input type="radio" name="type" value="0" <cfif #accountinfo.type# EQ 0>checked</cfif>/>
			    Customer</label>
			  <br />
			  <blockquote><input name="role" type="checkbox" value="ORDER REP" <cfif #accountinfo.role# EQ 'ORDER REP'>checked</cfif>/> This user is an ordering representative for his/her company</blockquote>
			  <label>
			    <input type="radio" name="type" value="1" <cfif #accountinfo.type# EQ 1>checked</cfif> />
			    Employee</label>
				<blockquote><input name="role" type="checkbox" value="ADMIN" <cfif #accountinfo.role# EQ 'ADMIN'>checked</cfif> /> This user can add/remove accounts</blockquote>
			  <br />
		    </p></td>
		</tr>
		<tr>
			<td>Account Number:</td>
			<td><cfoutput>
				<input type="text" name="customerNumber" value="#accountinfo.customerNumber#" />
				</cfoutput>
			</td>
		</tr>
		<tr>
			<td>E-Mail Address:</td>
			<td>
				<cfoutput>
				<input type="text" name="email" value="#accountinfo.email#" />
				</cfoutput>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="right"><input type="submit" class="normalButton" name="Submit" value="Submit"  /></td>
		</tr>
			
	</table>
</form>
</center>

</body>
</html>
