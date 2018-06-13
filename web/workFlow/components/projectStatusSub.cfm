<cfquery name="setProjectStatus" datasource="centerline">
	UPDATE projects
	SET		status=#url.status#,
			SubStatus='#url.SubStatus#'
	WHERE	id=#url.id#
</cfquery>

<cfquery name="p" datasource="centerline">
	SELECT clientID, clientJobNumber, status, subStatus FROM projects WHERE id=#url.id#
</cfquery>

<cfmodule template="/workFlow/components/projectStatusNotify.cfm" id="#url.id#" clientID="#p.clientID#" clientJobNumber="#p.clientJobNumber#" status="#p.status#" subStatus="#p.subStatus#">

