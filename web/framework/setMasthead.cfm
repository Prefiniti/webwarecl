<cfquery name="smh" datasource="centerline">
	UPDATE users SET masthead_closed=#url.value# WHERE id=#url.userid#
</cfquery>