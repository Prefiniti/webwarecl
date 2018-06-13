<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
	<cfquery name="assignjn" datasource="#session.datasource#">
		UPDATE projects SET clsJobNumber='#form.clsJobNumber#' WHERE id='#form.jobid#'
	</cfquery>

	<cflocation url="manageFiles.cfm?jobid=#form.jobid#&custid=#form.custid#" addtoken="no">
</body>
</html>
