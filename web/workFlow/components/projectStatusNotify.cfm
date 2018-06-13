
<cfquery name="c" datasource="centerline">
	SELECT * FROM users WHERE id='#attributes.clientID#'
</cfquery>

<cfoutput>

<cfmail to="#c.email#" from="donotreply@centerlineservices.biz" subject="Center Line Services - Job Status Changed" type="html">
	<h1>Job Status Changed</h1>
	
	<table>
		<tr>
			<td>Your Job Number:</td>
			<td>#attributes.clientJobNumber#</td>
		</tr>
		<tr>
			<td><strong>New Job Status:</strong></td>
			<td><cfif #attributes.Status# EQ 0>Incomplete<cfelse>Complete</cfif>/#attributes.SubStatus#</td>
		</tr>
	</table>
	<p><a href="http://www.centerlineservices.biz/projectView.cfm?id=#attributes.id#">View Project</a></p>
</cfmail>

</cfoutput>
