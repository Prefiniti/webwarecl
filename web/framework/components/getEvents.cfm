<cfquery name="getEvents" datasource="centerline">
	SELECT * FROM rt_events WHERE targetUser=#url.targetUser# AND viewed=0
</cfquery>

<cfoutput query="getEvents">
	#eventText#<br>
</cfoutput>

<cfquery name="geU" datasource="centerline">
	DELETE FROM rt_events WHERE targetUser=#url.targetUser#
</cfquery>

