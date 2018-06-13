<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Read Message</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="udread" datasource="#session.datasource#">
		UPDATE messageInbox SET tread='yes' WHERE id=#url.id#
	</cfquery>
	<cfquery name="m" datasource="#session.datasource#">
		SELECT messageInbox.id AS msgid, messageInbox.tsubject, messageInbox.tdate, messageInbox.tbody, messageInbox.refJobID, messageInbox.fromuser, users.longName FROM messageInbox INNER JOIN users ON users.id=messageInbox.fromuser WHERE messageInbox.id=#url.id#
	</cfquery>
	<table width="900" class="midTable" align="left">
		<tr>
			<td>
				<div class="sidebarBlock">
					<table width="100%">
						<tr>
							<th>MyCL Mail</th>
						</tr>
						<tr>
							<td><img src="graphics/folder.png" align="absmiddle" /> <a href="inbox.cfm?mailbox=inbox">My Inbox</a></td>
						</tr>
						<tr>
							<td><img src="graphics/folder.png" align="absmiddle" /> <a href="inbox.cfm?mailbox=sent">Sent Items</a></td>
						</tr>
					</table>
				</div>
				
				<div class="orderListBlock">
					<cfoutput>
					<table width="100%">
						<tr>
							<th colspan="2">Message View</th>
						</tr>
						<tr>
							<td><strong>From:</strong></td>
							<td>#m.longName#</td>
						</tr>
						<tr>
							<td><strong>Subject:</strong></td>
							<td>#m.tsubject#</td>
						</tr>
						<tr>
							<td><strong>Sent:</strong></td>
							<td>#DateFormat(m.tdate, "mm/dd/yyyy")#</td>
						</tr>
						<tr>
						<td><strong>Ref. Job No.:</strong></td>
							<td>
							<cfset session.urlparm=#m.refJobID#>
							<cfinclude template="getJobLink.cfm">
							</td>
							
						</tr>
						<tr>
							
							<td colspan="2">
							<div class="tMsg">
							<pre>#m.tbody#</pre>
							</div>
							</td>
						</tr>
					</table>
					</cfoutput>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
