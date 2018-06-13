<cfquery name="getFrom" datasource="centerline">
	SELECT longName FROM users WHERE id=#url.fromid#
</cfquery>

<cfquery name="createIM" datasource="centerline">
	INSERT INTO rt_events (eventText, targetUser, viewed, timestamp) VALUES
	('Message from #getFrom.longName#: <br />#url.body#', #url.toid#, 0, #CreateODBCDateTime(Now())#)
</cfquery>

<p style="color:red;">Message sent.</p>
