<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Job Invoice</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="gi" datasource="#session.datasource#">
		SELECT * FROM files WHERE projectID=#url.id# AND fileType='INVOICE'
	</cfquery>
			<cfoutput>	
	<cfif #gi.RecordCount# NEQ 0>
	<table width="800" class="midTable" align="center">
	<tr>
	<td align="center">
		<p class="VPLink"><img src="graphics/folder_go.png" align="absmiddle" /> <a href="http://www.centerlineservices.biz/datastore/projectfiles/#gi.filePath#">Download Invoice</a></p>
	</td>
	</tr>
	</table>
	<cfelse>
		<cfset session.message="No invoice is available for this job.">
		<cflocation url="customer-home.cfm" addtoken="no">
	</cfif>
	
	</cfoutput>
</body>
</html>
