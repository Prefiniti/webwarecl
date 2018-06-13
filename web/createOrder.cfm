<cfquery name="co" datasource="centerline">
	INSERT INTO projects
		(status,
		stage,
		confirm_id,
		clientID)
	VALUES
		(0,
		0,
		'#form.confirm_id#',
		#session.userid#)
</cfquery>

<cfquery name="getID" datasource="centerline">
	SELECT id FROM projects WHERE confirm_id='#form.confirm_id#'
</cfquery>

<cflocation url="orderWizard.cfm?step=2&id=#getID.id#">
