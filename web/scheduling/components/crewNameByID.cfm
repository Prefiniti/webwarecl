<cfquery name="cnbid" datasource="centerline">
	SELECT name FROM crews WHERE id=#attributes.id#
</cfquery>

<cfoutput query="cnbid">#name#</cfoutput>