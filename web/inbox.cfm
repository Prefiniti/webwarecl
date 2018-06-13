<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>
	<cfswitch expression="#url.mailbox#">
		<cfcase value="inbox">
			MyCL Mail - Inbox
		</cfcase>
		<cfcase value="sent">
			MyCL Mail - Sent Items
		</cfcase>
	</cfswitch>	
</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
<cfquery name="mail" datasource="#session.datasource#">
	<cfswitch expression="#url.mailbox#">
		<cfcase value="inbox">
			SELECT messageInbox.id AS msgid, messageInbox.tsubject, messageInbox.tdate, messageInbox.tread, users.username FROM messageInbox INNER JOIN users ON users.id=messageInbox.fromuser WHERE messageInbox.touser=#session.userid# ORDER BY messageInbox.tdate
		</cfcase>
		<cfcase value="sent">
			SELECT messageInbox.id AS msgid, messageInbox.tsubject, messageInbox.tdate, messageInbox.tread, users.username FROM messageInbox INNER JOIN users ON users.id=messageInbox.fromuser WHERE messageInbox.fromuser=#session.userid# ORDER BY messageInbox.tread, messageInbox.tdate 
		</cfcase>
	</cfswitch>	
	
</cfquery>

<table class="midTable" width="900" cellpadding="0" cellspacing="0" align="left">
	<tr>
		<td>
			<div class="sidebarBlock">
				<table width="100%">
					<tr>
						<th>MyCL Mail</th>
					</tr>
					<tr>
						<td>
							<img src="graphics/folder.png" align="absmiddle" /> <a href="inbox.cfm?mailbox=inbox">Inbox</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="graphics/folder.png" align="absmiddle" /> <a href="inbox.cfm?mailbox=sent">Sent Items</a>
						</td>
					</tr>
				</table>
			
			</div>

			<div class="orderListBlock">
				<table width="100%">
					<tr>
						<th>&nbsp;</th>
						<th>From</th>
						<th>Date</th>
						<th>Subject</th>
						
					</tr>
					
					<cfoutput query="mail">
						<tr>
							<td><a href="readMsg.cfm?id=#msgid#"><img src="graphics/email_open.png" border="0" /></td>
							<td><cfif #tread# EQ "no"><strong></cfif>#username#</td>
							<td>#DateFormat(tdate, "mm/dd/yyyy")#</td>
							<td>#tsubject#<cfif #tread# EQ "no"></strong></cfif></td>
							
						</tr>
					</cfoutput>
				</table>
			</div>
		<br />
		</td>
	</tr>
</table>

</body>
</html>
