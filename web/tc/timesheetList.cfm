<link href="../centerline.css" rel="stylesheet" type="text/css">
<!---action=list&filter=loginOnly&userid=#session.userid#--->


<cfquery name="getTimesheets" datasource="centerline">
	<cfswitch expression="#url.filter#">
		<cfcase value="loginOnly">
			SELECT * FROM time_card WHERE emp_id=#url.userid# ORDER BY date, clsJobNumber
		</cfcase>
		<cfcase value="all">
			SELECT * FROM time_card ORDER BY date, clsJobNumber
		</cfcase>
	</cfswitch>
</cfquery>

<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th align="left">Date</th>
		<th align="left">Job Number</th>
		<th align="left">Job Description</th>
		
	</tr>
	
	<cfoutput query="getTimesheets">
		<tr>
			<td><a href="timeEntry.cfm?action=editTimesheet&id=#id#">#DateFormat(date, "mmmm dd, yyyy")#</a></td>
			<td>#clsJobNumber#</td>
			<td>#JobDescription#</td>
			
		</tr>
	</cfoutput>
</table>



