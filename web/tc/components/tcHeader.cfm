
<cfquery name="gH" datasource="centerline">
	SELECT * FROM time_card WHERE id=#attributes.id#
</cfquery>

<table width="100%" cellspacing="0">
	<tr>
		<th colspan="2" align="left" class="tsTitle">Center Line Services, LLC</th>	
		<th colspan="2" align="right" class="tsTitle">Project Log Sheet</th>
	</tr>
	
	<cfoutput query="gH">
		<tr>
		  <td><strong>Name:</strong><br /> <cfmodule template="/tc/components/tcUser.cfm" id="#emp_id#"> </td>
			<td><strong>Date:</strong><br>
		  #DateFormat(date, "mm/dd/yyyy")#</td>
			<td><strong>Job No.:</strong><br>
		  #clsJobNumber#</td>
			<td><strong>Job Description:</strong><br>
		  #JobDescription#</td>
		</tr>
	</cfoutput>
</table>