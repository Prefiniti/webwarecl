<cfquery name="gDesc" datasource="centerline">
	SELECT description FROM projects WHERE id=#url.id#
</cfquery>

<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px; margin-bottom:0px; padding-botton:2px;">Project Name</h3>

<cfoutput>
<div style="padding:30px;">
	<label>Please enter a name for this project: <input type="text" name="description" id="description" value="#gDesc.description#"></label>
</div>


<hr>

<table width="100%">
	<tr>
		<td align="right">
			<input type="button" name="next" class="normalButton" value="Next" onclick="writeStep(#url.id#, #url.step#);">
		</td>
	</tr>
</table>
</cfoutput>		