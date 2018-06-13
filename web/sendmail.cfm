<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>

	<cfquery name="sm" datasource="#session.datasource#">
		INSERT INTO messageInbox 
		(FROMUSER,
		TOUSER,
		TSUBJECT,
		TBODY,
		TDATE,
		TREAD,
		REFJOBID)
	VALUES
		(#form.fromuser#,
		#form.touser#,
		'#form.subject#',
		'#form.bodyV#',
		#form.date#,
		'no',
		#form.jobid#)
	</cfquery>
	<cfset session.message="Message sent.">
	<cflocation url="default.cfm" addtoken="no">
</body>
</html>
