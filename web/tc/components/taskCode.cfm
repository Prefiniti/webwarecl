

<cfquery name="taskCode" datasource="centerline">
	SELECT task_id, item FROM task_codes WHERE id=#attributes.id#
</cfquery>

<cfoutput query="taskCode">
	#task_id#
</cfoutput>