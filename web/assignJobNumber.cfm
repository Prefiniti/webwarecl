<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Assign Job Number</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
<cfquery name="j" datasource="#session.datasource#">
SELECT * FROM projects WHERE id='#URL.jobid#'
</cfquery>

<cfquery name="c" datasource="#session.datasource#">
SELECT * FROM users WHERE id='#url.custid#'
</cfquery>
	
	<cfoutput>
	<form name="ajn" action="jnsubmit.cfm" method="post">
	<input type="hidden" name="jobid" value="#url.jobid#" />
	<input type="hidden" name="custid" value="#url.custid#" />
	<table width="800" class="midTable" align="center">
		<tr>
			<th colspan="2">Assign Job Number</th>
		</tr>
		<tr>
			<td>Customer:</td>
			<td>#c.longName#</td>
		</tr>
		<tr>
			<td>Project:</td>
			<td>#j.description#</td>
		</tr>
		<tr>
			<td><strong>CLS Job Number:</strong></td>
			<td><input type="text" name="clsJobNumber" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="right"><input type="submit" class="normalButton" name="Submit" value="Submit" /></td>
		</tr>
	</table>
	</form>
	</cfoutput>
</body>
</html>
