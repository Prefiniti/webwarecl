<cfquery name="updateLastLoaded" datasource="centerline">
	UPDATE users SET last_loaded_page='#url.last_loaded_page#' WHERE id=#url.calledByUser#
</cfquery>