
<cfquery name="mail" datasource="centerline">
	<cfswitch expression="#url.mailbox#">
		<cfcase value="inbox">
			SELECT messageInbox.id AS msgid, messageInbox.tsubject, messageInbox.tdate, messageInbox.tread, users.username FROM messageInbox INNER JOIN users ON users.id=messageInbox.fromuser WHERE messageInbox.touser=#url.userid# ORDER BY messageInbox.tdate DESC
		</cfcase>
		<cfcase value="sent messages">
			SELECT messageInbox.id AS msgid, messageInbox.tsubject, messageInbox.tdate, messageInbox.tread, users.username FROM messageInbox INNER JOIN users ON users.id=messageInbox.fromuser WHERE messageInbox.fromuser=#url.userid# ORDER BY messageInbox.tread, messageInbox.tdate DESC
		</cfcase>
	</cfswitch>	
	
</cfquery>

<cfoutput>
<!--
<wwafcomponent>View #url.mailbox#</wwafcomponent>
-->
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:##3399CC; font-weight:lighter; font-size:24px; margin-top:3px; text-transform:capitalize;">My #url.mailbox#</h3>
<table width="100%">
	<tr>
		<td style="background-color:##CCCCCC">
			<img src="/graphics/email_add.png" align="absmiddle"> <a href="javascript:writeMessage();">Write Message</a>
		</td>
	</tr>
</table>
</cfoutput>

<table width="100%" cellspacing="0">
	<tr>
		<th>&nbsp;</th>
		<th>From</th>
		<th>Date</th>
		<th>Subject</th>
		
	</tr>
	
	<cfoutput query="mail">
		<tr>
			<td><a href="javascript:viewMessage(#msgid#)"><img src="graphics/email_open.png" border="0" /></td>
			<td><cfif #tread# EQ "no"><strong></cfif>#username#</td>
			<td>#DateFormat(tdate, "mm/dd/yyyy")#</td>
			<td>#tsubject#<cfif #tread# EQ "no"></strong></cfif></td>
			
		</tr>
	</cfoutput>
</table>


