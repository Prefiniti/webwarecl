<cfquery name="gSub" datasource="centerline">
	SELECT * FROM subdivisions WHERE id=#attributes.id#
</cfquery>

<cfoutput>#gSub.name#</cfoutput>