<cfquery name="smsUsers" datasource="centerline">
	SELECT * FROM users WHERE type=1 AND receives_timesheet_reminders=1
</cfquery>


<cfoutput query="smsUsers">
	<cfmodule template="/tc/components/checkRem.cfm" userid="#smsUsers.id#">
</cfoutput>