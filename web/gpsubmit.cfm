<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
	<cfquery name="gp" datasource="#session.datasource#">
		SELECT * FROM users WHERE email='#form.email#'
	</cfquery>
	
	<cfif #gp.RecordCount# NEQ 0>
		<cfmail to="#gp.email#" from="donotreply@centerlineservices.biz" subject="Center Line Services password" type="html">
			<h1>Your Password</h1>
			<p>Username: #gp.username#</p>
			<p>Password: #gp.password#</p>
		</cfmail>
		<cfset session.message="Your password has been mailed to #gp.email#.">
	<cfelse>
		<cfset session.message="No account exists with that e-mail address.">
	</cfif>
	
	<cflocation url="login.cfm" addtoken="no">
	
</body>
</html>
