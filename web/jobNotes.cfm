<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Job Notes</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="notes" datasource="#session.datasource#">
		SELECT * FROM jobNotes WHERE jobid=#url.jobid# ORDER BY date DESC
	</cfquery>
	
	<form name="jn" <cfoutput>action="notesubmit.cfm?jobid=#url.jobid#&custid=#url.custid#" </cfoutput>method="post">
	<cfoutput>
	<input type="hidden" name="jobid" value="#url.jobid#" />
	<input type="hidden" name="employee" value="#session.username#" />
	<input type="hidden" name="date" value="#Now()#" />
	</cfoutput>
	<table width="800" class="midTable" align="center">
		<tr>
			<th colspan="2">Add Job Note</th>
		</tr>
		<tr>
			<td>Note:</td>
			<td align="right"><textarea name="note" rows="10" cols="80"></textarea></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="right"><input type="submit" class="normalButton" name="submit" value="Save Note" /></td>
		</tr>
		<tr>
			<th colspan="2">Existing Notes - <cfoutput>#notes.RecordCount#</cfoutput></th>
		</tr>
		<cfoutput query="notes">
		<tr>
			<td><em>#employee#</em><br />#DateFormat(date, "mm/dd/yyyy")# #TimeFormat(date,"h:mm tt")#</td>
			<td>#note#</td>
		</tr>
		</cfoutput>
			
	</table>
	</form>
</body>
</html>
