<cfquery name="writeTaskCode" datasource="centerline">
	INSERT INTO task_codes
		(task_id,
		item,
		description,
		rate,
		charge_type)
	VALUES
		(#url.task_id#,
		'#url.item#',
		'#url.description#',
		#url.rate#,
		'#url.charge_type#')
</cfquery>

<cflocation url="/timeEntry.cfm?action=manageTaskCodes" addtoken="no">
