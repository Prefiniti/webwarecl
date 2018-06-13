

<cfquery name="liByTC" datasource="centerline">
	SELECT * FROM time_entries WHERE timecard_id=#attributes.timecard_id#
</cfquery>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<th width="10%" align="left">Task Code</th>
		<th align="left">Detailed Description of Services</th>
		<th align="left" width="8%">Bk/Pg</th>
		<th align="left" width="8%">OD Start</th>
		<th align="left" width="8%">OD End</th>
		<th align="left" width="8%">Total Mileage</th>
		<th align="left" width="8%">Hours</th>
	</tr>
	<cfoutput query="liByTC">
		<tr>
			<td><cfmodule template="/tc/components/taskCode.cfm" id="#taskCodeID#"></td>
			<td>#description#</td>
			<td>#bookPage#</td>
			<td>#odStart#</td>
			<td>#odEnd#</td>
			<td>#mileage#</td>
			<td>#hours#</td>
		</tr>
	</cfoutput>
</table>