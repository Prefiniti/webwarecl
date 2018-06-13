<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
<cfoutput>
<cfloop index="x" list="#Form.FieldNames#">

	<cfquery name="q" datasource="centerline">
		SELECT users.longName, users.customerNumber, users.email, projects.description, projects.status, projects.SubStatus,projects.clsJobNumber, projects.id AS jobid, users.id AS custid, projects.duedate FROM projects INNER JOIN users ON users.id=projects.clientid WHERE clsJobNumber='#x#'
	</cfquery>
	<cfif #q.email# NEQ "">
	<cfmail from="surveyoffice@centerlineservices.biz" to="#q.email#" subject="Delinquent Reminder" type="html">
		Your Center Line Services project no. #q.clsJobNumber# is 30 days or more delinquent.
	</cfmail>
	</cfif>
</cfloop>
</cfoutput>
<cfset session.message="Delinquent Reminders have been sent.">

<cflocation url="mycl-emp.cfm" addtoken="no">
</body>
</html>
