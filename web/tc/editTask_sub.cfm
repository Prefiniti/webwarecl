<link href="../centerline.css" rel="stylesheet" type="text/css">

<cfquery name="writeTaskChanges" datasource="centerline">
	UPDATE task_codes 
	SET	task_id=#form.task_id#,
		item='#form.item#',
		description='#form.description#',
		rate=#form.rate#,
		charge_type='#form.charge_type#'
	WHERE id=#url.id#
		
</cfquery>

<cflocation url="/timeEntry.cfm?action=manageTaskCodes" addtoken="no">
