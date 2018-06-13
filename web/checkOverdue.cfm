<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Send Overdue Reminders</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
<cfquery name="od" datasource="#session.datasource#">
	SELECT * FROM projects WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) > duedate AND SubStatus <> "Closed";
</cfquery>
<form name="reminders" action="sendReminders.cfm" method="post">

<table width="800" class="midTable" align="center" cellpadding="10">
	<tr>
		<th colspan="5">Delinquent Orders </th>
	</tr>
	<tr>
		<th><img align="absmiddle" src="graphics/email.png"/> </th>
		<th>Job Number</th>
		<th>Job Title</th>
		<th>Due Date</th>
		<th>Days Past Due</th>
	</tr>
	<cfoutput query="od">
		
		<tr>
			<td><input type="checkbox" name="#clsJobNumber#" value="#clsJobNumber#" checked/></td>
			<td><a href="manageFiles.cfm?jobid=#id#&custid=#clientID#">#clsJobNumber#</a></td>
			<td>#description#</td>
			<td>#DateFormat(duedate, "mm/dd/yyyy")#</td>
			<td><font color="red">#DateDiff("d", duedate, Now())# days past due</font> </td>
		</tr>
	</cfoutput>
	<tr>
		<td colspan="5" align="right"><input type="submit" class="normalButton" name="submit" value="Send Reminders" /></td>
	</tr>
</table>
</form>
</body>
</html>
