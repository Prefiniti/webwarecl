<cfquery name="u" datasource="centerline">
	SELECT longName FROM users WHERE id=#attributes.id#
</cfquery>

<cfoutput query="u">#longName#</cfoutput>
