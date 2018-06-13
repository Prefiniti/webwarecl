<cfquery name="pnUpdate" datasource="centerline">
	UPDATE projects
	SET		clsJobNumber='#url.clsJobNumber#'
	WHERE	id=#url.id#
</cfquery>