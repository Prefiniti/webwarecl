<!--
<wwafcomponent>Write a Message</wwafcomponent>
-->

	<cfquery name="usr" datasource="centerline">
		SELECT * FROM users
	</cfquery>
	<cfquery name="jobs" datasource="centerline">
		SELECT id, clsJobNumber 
		FROM projects 
		WHERE clsJobNumber != '' 
		<cfif #url.permissionLevel# EQ 0>
			AND clientID=#url.calledByUser#
		</cfif>
		ORDER BY clsJobNumber
	</cfquery>
	<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">Write Message</h3>
<table width="100%">
	<tr>
		<td style="background-color:#CCCCCC">
			<img src="/graphics/email.png" align="absmiddle"> <a href="javascript:viewMailFolder('inbox')">Return to Inbox</a>
		</td>
	</tr>
</table>
	<form name="newmail" action="sendmail.cfm" method="post">
	
	<table width="100%">

		<tr>
			<td valign="top"><img src="/graphics/user.png" align="absmiddle"/> Recipient:</td>
			<td>
				<select name="touser" id="touser">
					<cfif IsDefined("url.toID")>
					<cfoutput>
						<option value="#url.toID#" selected>#url.longName#</option>
					</cfoutput>
					</cfif>
					<cfoutput query="usr">
						<option value="#id#">#longName#</option>
					</cfoutput>
			  	</select><label><input type="checkbox" name="readReceipt" id="readReceipt" />Request read receipt</label>			</td>
		</tr>
		<tr>
			<td valign="top" ><img src="/graphics/email_edit.png" align="absmiddle"/> Subject:</td>
			<td valign="top" ><input name="subject" id="subject" type="text" size="30" /></td>
		</tr>
		<tr>
		  <td valign="top"><img src="/graphics/wrench.png" align="absmiddle" /> Reference Project:</td>
		  <td valign="top"><select name="jobid" id="jobid">
		  				<option value="" selected>None</option>
					<cfoutput query="jobs">
						<option value="#id#">#clsJobNumber#</option>
					</cfoutput>
			  	</select></td>
	  </tr>
		<tr>
			<td valign="top" ><img src="/graphics/email.png" align="absmiddle"/> Body:</td>
			<td valign="top" ><textarea name="bodyV" id="bodyText" cols="40" rows="10"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<!--function sendMessage(fromUser, toUser, refJobID, subject, bodyText)-->
				<input type="button" name="sendMail" class="normalButton" value="Send Message" onclick="sendMessage(glob_userid, GetValue('touser'), GetValue('jobid'), GetValue('subject'), GetValue('bodyText'), IsChecked('readReceipt'));">
			</td>
		</tr>
	</table>
	</form>


