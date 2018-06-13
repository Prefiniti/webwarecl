<cfquery name="gc" datasource="centerline">
	SELECT name FROM companies WHERE id=#attributes.id#
</cfquery>

<cfoutput>#gc.name#</cfoutput>