<cfquery name="cn" datasource="centerline">
	SELECT longName FROM users WHERE id=#attributes.id#
</cfquery>

<cfoutput><a href="##" onmouseover="userDropDown(this, event, #attributes.id#, '#cn.longName#');">#cn.longName#</a></cfoutput>