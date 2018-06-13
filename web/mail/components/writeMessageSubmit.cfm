<cfquery name="sendMessage" datasource="centerline">
	INSERT INTO messageInbox 
		(fromuser,
		touser,
		tsubject,
		tbody,
		tdate,
		tread,
		readReceipt
		<cfif #url.refJobID# NEQ "">
			,refJobID
		</cfif>
		)
	VALUES
		(#url.fromuser#,
		#url.touser#,
		'#url.tsubject#',
		'#url.tbody#',
		#CreateODBCDateTime(Now())#,
		'no',
		#url.readReceipt#
		<cfif #url.refJobID# NEQ "">
			,#url.refJobID#
		</cfif>
		)		
</cfquery>

<cfquery name="getFromUser" datasource="centerline">
	SELECT longName FROM users WHERE id=#url.fromuser#
</cfquery>

<cfquery name="getToUser" datasource="centerline">
	SELECT longName FROM users WHERE id=#url.touser#
</cfquery>

<cfquery name="createMessageEvent" datasource="centerline">
	INSERT INTO rt_events (eventText, targetUser, viewed, timestamp) VALUES
	('You have mail!',
	#url.touser#, 0, #CreateODBCDateTime(Now())#)
</cfquery>	

<table width="100%">
	<tr>
		<td align="center">
			<h3>Message Sent</h3>
			
			<p class="VPLink"><img src="/graphics/folder.png" align="absmiddle"> <a href="javascript:viewMailFolder('inbox');">Inbox</a></p>
		</td>
	</tr>
</table>