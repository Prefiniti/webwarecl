<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Accounts</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="ga" datasource="#session.datasource#">
		SELECT users.Role, users.id, users.longName, users.username, users.customerNumber, users.email, users.type, companies.name FROM companies INNER JOIN users ON users.company=companies.id ORDER BY companies.name
	</cfquery>
	
	<cfquery name="getCompanies" datasource="#session.datasource#">
		SELECT * FROM companies ORDER BY name
	</cfquery>
	<a name="manageExisting">
	<table class="midTable" width="800" align="center">
		<tr>
			<th colspan="7">Manage Existing Accounts</th>
		</tr>
		<tr>
			<th class="subHead">Company</th>
			<th class="subHead">Customer</th>
			<th class="subHead">Username</th>
			<th class="subHead">Number</th>
			<th class="subHead">Email</th>
			<th class="subHead">Type</th>
			<th class="subHead">Actions</th>
		</tr>
		<cfoutput query="ga">
		<tr>
			<td>#name#</td>
			<td>#longName#</td>
			<td>#username#</td>
			<td>#customerNumber#</td>
			<td>#email#</td>
			<td>
				<cfswitch expression="#type#">
					<cfcase value="0">
						Customer #role#
					</cfcase>
					<cfcase value="1">
						Employee #role#
					</cfcase>
				</cfswitch>			</td>
			<td nowrap>
				<img src="graphics/user_delete.png" border="0" align="absmiddle"/> <a href="deleteAccount.cfm?id=#id#">Delete</a><br />
				<img src="graphics/user_edit.png" border="0" align="absmiddle"/> <a href="editAccount.cfm?id=#id#">Edit Account</a></td>
		</tr>
		</cfoutput>
		
	</table>
	<a name="addNew">
	<form name="an" action="addAccount.cfm" method="post">
	<table class="midTable" width="800" align="center">
	
		<tr>
			<th colspan="2">Add New Account</th>
		</tr>
		<tr>
			<td>Company:</td>
			<td>
				<select name="company" >
					<cfoutput query="getCompanies">
						<option value="#id#">#name#</option>
					</cfoutput>	
				</select><a href="manageCompanies.cfm">Manage Companies</a>		</td>
		</tr>
		<tr>
			<td>Account Name:</td>
			<td><input type="text" name="longName" /></td>
		</tr>
		<tr>
			<td>Username:</td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>Account Class:</td>
			<td><p>
			  <label>
			    <input type="radio" name="type" value="0" checked/>
			    Customer</label>
			  <br />
			  <blockquote><input name="role" type="checkbox" value="ORDER REP" /> This user is an ordering representative for his/her company</blockquote>
			  <label>
			    <input type="radio" name="type" value="1" />
			    Employee</label>
				<blockquote><input name="role" type="checkbox" value="ADMIN" /> This user can add/remove accounts</blockquote>
			  <br />
		    </p></td>
		</tr>
		<tr>
			<td>Account Number:</td>
			<td><input type="text" name="customerNumber" /></td>
		</tr>
		<tr>
			<td>E-Mail Address:</td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" class="normalButton" name="submit" value="Create Account" /></td>
		</tr>
	</table>
	</form>
		
</body>
</html>
