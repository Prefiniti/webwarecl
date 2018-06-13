<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Jobs</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="qryGetJobs" datasource="#session.datasource#">
		SELECT * FROM projects WHERE clientID='#URL.id#'
	</cfquery>
	<cfquery name="qryGetCustInfo" datasource="#session.datasource#">
		SELECT longName, id AS custid FROM users WHERE id='#URL.id#'
	</cfquery>
	
	<table width="800" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<th colspan="3">Jobs for <cfoutput>#qryGetCustInfo.longName#</cfoutput></th>
			
		<tr>
			<th class="subHead">CLS Job Number</th>
			<th class="subHead">Status</th>
			<th class="subHead">Job Links</th>	
		</tr>
		<cfoutput query="qryGetJobs">
		<tr>
			<td class="int"><cfif #clsJobNumber# NEQ "">#clsJobNumber#<cfelse><a href="assignJobNumber.cfm?jobid=#id#&custid=#qryGetCustInfo.custid#">Assign Job Number</a></cfif><br />#description#</td>
			<td class="int">
				<cfswitch expression="#status#">
					<cfcase value="0">Incomplete</cfcase>
					<cfcase value="1">Complete</cfcase>
				</cfswitch>			
			</td>
			<td class="int">
				<a href="forms/viewJob.cfm?jobid=#id#&custid=#qryGetCustInfo.custid#" target="_blank">View Printable Order</a><br />
				<a href="manageFiles.cfm?jobid=#id#&custid=#qryGetCustInfo.custid#">Job Home Page</a>	
			</td>
		</tr>
		</cfoutput>
	</table>
</body>
</html>
