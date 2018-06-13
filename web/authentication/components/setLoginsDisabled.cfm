<cfquery name="setLoginsDisabled" datasource="centerline">
	UPDATE config SET logins_disabled=#url.logins_disabled#
</cfquery>