
<cfquery name="ap" datasource="centerline">
	UPDATE time_card SET closed=2 WHERE id=#url.id#
</cfquery>

<cfmodule template="/tc/components/tcStatus.cfm" id="#url.id#">