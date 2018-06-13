<cfquery name="udRFP" datasource="centerline">
	DELETE FROM projects WHERE id=#url.id#
</cfquery>

<table width="100%">
	<tr>
    	<td align="center">
        	<h1>Proposal Declined.</h1>
                    
            <cfoutput><p class="VPLink"><a href="javascript:loadHomeView();">Home</a></p></cfoutput>
        </td>
	</tr>
</table>            
