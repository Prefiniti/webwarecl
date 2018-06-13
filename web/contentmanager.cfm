<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
	<cfswitch expression="#url.action#">
		<cfcase value="delete">
			<cffile action="delete" file="/var/apache/htdocs/datastore/projectfiles/#url.name#">
		</cfcase>
	</cfswitch>
	
	<cfquery name="u" datasource="#session.datasource#">
		DELETE FROM files WHERE filePath='#url.name#'
	</cfquery>
	<cfset session.message="File #url.name# has been deleted.">
	
	<cflocation url="manageFiles.cfm?jobid=#url.jobid#&custid=#url.custid#" addtoken="no">
<body>
</body>
</html>
