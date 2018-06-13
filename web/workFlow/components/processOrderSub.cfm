
<cfquery name="updateP" datasource="centerline">
	UPDATE projects 
	SET		stage=#url.stage#,
			clsJobNumber='#url.clsJobNumber#',
			charge_type='#url.charge_type#'
	WHERE id=#url.id#
</cfquery>

<cfif #url.stage# EQ 1>
	<cfquery name="setStatus" datasource="centerline">
		UPDATE projects 
		SET		SubStatus='Awarded'
		WHERE	id=#url.id#
	</cfquery>
<cfelse>
	<cfquery name="setReverseExplanation" datasource="centerline">
		UPDATE projects
		SET		reverse_explanation='#url.reverse_explanation#'
		WHERE	id=#url.id#
	</cfquery>
</cfif>


<cfif #url.publish# EQ "true">
	<cfquery name="as" datasource="centerline">
		INSERT INTO news_items (date, headline, body)
		VALUES		(#CreateODBCDateTime(Now())#,
					'New order placed',
					'#url.articleText#')
	</cfquery>
</cfif>


<cfquery name="p" datasource="centerline">
	SELECT * FROM projects WHERE id=#url.id#
</cfquery>

<cfmodule template="/workFlow/components/orderProcessNotify.cfm" id="#url.id#" clientID="#url.clientID#" clientJobNumber="#p.clientJobNumber#" status="#p.status#" subStatus="#p.subStatus#">

<cfoutput>
<table width="100%">
	<tr>
		<td align="center">
			<h2>Order Processed</h2>
			<p class="VPLink"><a href="javascript:loadProjectViewer(#url.id#);">View project</a></p>
		</td>
	</tr>
</table>
</cfoutput>
