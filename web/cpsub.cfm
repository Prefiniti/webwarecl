<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
	<cfif #form.password# EQ #form.confirm#>
		<cfquery name="udp" datasource="#session.datasource#">
			UPDATE users SET password='#form.password#' WHERE id=#session.userid#
		</cfquery>
		<cfset session.message="Password updated.">
		<cflocation url="default.cfm" addtoken="no">
		
	<cfelse>
		<cfset session.message="Passwords do not match. Please try again.">
		<cflocation url="resetPassword.cfm" addtoken="no">
	</cfif>
</body>
</html>
