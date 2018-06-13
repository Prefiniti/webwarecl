<cfquery name="gpn" datasource="centerline">
	SELECT clsJobNumber FROM projects WHERE id=#attributes.id#
</cfquery>

<cfoutput query="gpn">#clsJobNumber#</cfoutput>