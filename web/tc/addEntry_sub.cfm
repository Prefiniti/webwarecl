<cfquery name="writeItem" datasource="centerline">
	INSERT INTO time_entries
		(hours,
		bookPage,
		description,
		taskCodeID,
		timecard_id,
		odStart,
		odEnd,
		mileage)
	VALUES
		(#url.hours#,
		'#url.bookPage#',
		'#url.description#',
		#url.taskCodeID#,
		#url.timecard_id#,
		#url.odStart#,
		#url.odEnd#,
		#url.mileage#)
</cfquery>

<cfoutput>
<table width="100%">
	<tr>
		<td align="center">
			<h1>Line Item Saved</h1>
			<p class="VPLink"><a href="javascript:openTS(#url.timecard_id#, 'tcTarget');">Return to Timesheet View</a></p>
		</td>
	</tr>
</table>
</cfoutput>