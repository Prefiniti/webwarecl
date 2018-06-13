<cfquery name="setMaintenance" datasource="centerline">
	UPDATE config SET maintenance=#url.maintenance#
</cfquery>