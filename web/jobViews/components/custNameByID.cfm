<cfquery name="cn" datasource="centerline">
	SELECT longName FROM users WHERE id=#attributes.id#
</cfquery>

<cfoutput>#cn.longName#</cfoutput>