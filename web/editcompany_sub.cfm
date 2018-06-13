<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
	<cfquery name="udcomp" datasource="#session.datasource#">
		UPDATE companies SET name='#form.name#', address='#form.address#' WHERE id=#form.id#
	</cfquery>
	<cflocation url="editCompany.cfm?id=#form.id#" addtoken="no">
</body>
</html>
