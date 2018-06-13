

<cfquery name="CreateTimesheet" datasource="centerline">
	INSERT INTO time_card 
		(emp_id,
		date,
		clsJobNumber,
		JobDescription,
		startTime,
		submitID)
	VALUES (#url.emp_id#,
			#CreateODBCDateTime(url.date)#,
			<cfswitch expression="#url.JobNumberType#">
				<cfcase value="Existing">
					'#url.JobNumSel#',
				</cfcase>
				<cfcase value="New">
					'#url.JobNumManual#',
				</cfcase>
			</cfswitch>
			'#url.JobDescription#',
			#CreateODBCDateTime(url.startTime)#,
			'#url.submitID#')		
</cfquery>

<cfquery name="gTSid" datasource="centerline">
	SELECT id FROM time_card WHERE submitID='#url.submitID#'
</cfquery>

<cfoutput>
<table width="100%">
	<tr>
		<td align="center">
			<h1>Timesheet Created Successfully</h1>
			<p class="VPLink"><a href="javascript:openTS(#gTSid.id#, 'tcTarget');">Go to Timesheet View</a></p>
		</td>
	</tr>
</table>
</cfoutput>
