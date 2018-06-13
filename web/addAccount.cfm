<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
	<cfinsert datasource="#session.datasource#" tablename="users">
	
	<cfmail to="#form.email#" from="donotreply@centerlineservices.biz" subject="Center Line Services Account Information" type="html">
	<h1>New Account Created</h1>
	<p>Your account has been created!</p>
	
	<table>
		<tr>
			<td>Username:</td>
			<td>#form.username#</td>
		</tr>
		<tr>
			<td>Initial Password:</td>
			<td>#form.password#</td> <font color="red">Please reset your password the first time you log in</font>
		</tr>
	</table>
	
	<a href="http://www.centerlineservices.biz/login.cfm">Click here to go to the login page</a>
	
</cfmail>
<cfset session.message="New account created.">
<cflocation url="manageCustomers.cfm" addtoken="no">

</body>
</html>
