<cfquery name="getFrom" datasource="centerline">
	SELECT email, longName FROM users WHERE id=#url.from#
</cfquery>

<cfquery name="getTo" datasource="centerline">
	SELECT smsnumber FROM users WHERE id=#url.to#
</cfquery>

<cfoutput>
<cfmail from="#getFrom.email#" to="#getTo.smsnumber#" subject="MyCL message from #getFrom.longName#">#url.message#</cfmail>
</cfoutput>

<p style="color:red">Message sent.</p>