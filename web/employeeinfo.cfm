<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Account Profile</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="c" datasource="#session.datasource#">
		SELECT * FROM users WHERE id=#url.id#
	</cfquery>
	
	<cfoutput>
	<table width="800" class="midTable" align="center">
		<tr>
			<th colspan="2">Customer Profile - Customer No. #c.customerNumber#</th>
		</tr>
		<tr>
			<td>Name:</td>
			<td>#c.longName#</td>
		</tr>
		<tr>
			<td>E-Mail:</td>
			<td>#c.email#</td>
		</tr>
	</table>
	</cfoutput>
</body>
</html>
