<cfquery name="gc" datasource="centerline">
	SELECT name FROM companies WHERE id=#attributes.id#
</cfquery>

<cfoutput><a href="##" onmouseover="companyDropDown(this, event, #attributes.id#, '#gc.name#');">#gc.name#</a></cfoutput>