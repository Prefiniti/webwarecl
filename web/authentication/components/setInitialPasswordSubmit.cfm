<cfquery name="setInitialPW" datasource="centerline">
	UPDATE users.
	SET		password='#url.password#'
	WHERE	id=#url.id#
</cfquery>

<table width="100%">
<tr>
	<td align="center">
		<h3>Password Set</h3>
		
		<p class="VPLink"><img src="/graphics/application_go.png" border="0" align="absmiddle"> <a href="javascript:getWebWareLogin();">Log In</a></p>
	</td>
</tr>
</table>