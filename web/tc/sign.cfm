<link href="../centerline.css" rel="stylesheet" type="text/css">
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">Sign My Timesheet</h3>
<form name="signTS" id="signTS">
<cfoutput>
	<input type="hidden" name="id" value="#url.id#" />
</cfoutput>
<table width="100%" cellpadding="8px">

<tr>
	<td colspan="2">
		<table border="1">
			<tr>
				<td>
					<cfmodule template="/tc/components/tcHeader.cfm" id="#url.id#"><br />
					<cfmodule template="/tc/components/lineItemsByTC.cfm" timecard_id="#url.id#"><br />
					<cfmodule template="/tc/components/tcFooter.cfm" id="#url.id#">
				</td>
			</tr>
		</table>
	</td>
	</tr>
<tr>
	<td colspan="2"><p style="font-weight:bold">By signing this timesheet I certify that its contents are accurate to the best of my ability.</p></td>
</tr>
<tr>
	<td>Initials:</td>
	<td><input type="text" id="initials" name="initials"></td>
</tr>
<tr>
	<td>Project Status:</td>
	<td><input type="checkbox" name="completeProject" value="complete project">Activities on this timesheet complete project</td>
</tr>
<tr>
	<td colspan="2" align="right"><input name="Submit" type="button" class="normalButton" value="Sign Timesheet" onclick="AjaxSubmitForm(AjaxGetElementReference('signTS'), '/tc/sign_sub.cfm', 'tcTarget');"></td>
	
</tr>
</table>
</form>
