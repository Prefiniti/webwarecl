
<style type="text/css">
pre {
 white-space: pre-wrap;       /* css-3 */
 white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
 white-space: -pre-wrap;      /* Opera 4-6 */
 white-space: -o-pre-wrap;    /* Opera 7 */
 word-wrap: break-word;       /* Internet Explorer 5.5+ */
}
</style>
<cfquery name="m" datasource="centerline">
	SELECT messageInbox.id AS msgid, messageInbox.readReceipt, messageInbox.tread, messageInbox.touser, messageInbox.tsubject, messageInbox.tdate, messageInbox.tbody, messageInbox.refJobID, messageInbox.fromuser, users.longName FROM messageInbox INNER JOIN users ON users.id=messageInbox.fromuser WHERE messageInbox.id=#url.id#
</cfquery>

<cfif #m.readReceipt# EQ 1 AND #m.tread# EQ "no">
	<cfquery name="srr" datasource="centerline">
	INSERT INTO messageInbox 
		(fromuser,
		touser,
		tsubject,
		tbody,
		tdate,
		tread
		)
	VALUES
		(#m.touser#,
		#m.fromuser#,
		'Read Receipt - #m.tsubject#',
		'Your message was read on #DateFormat(Now(), "mm/dd/yyyy")# at #TimeFormat(Now(), "h:mm tt")#',
		#CreateODBCDateTime(Now())#,
		'no'
		)		
	</cfquery>
</cfif>

<cfquery name="udread" datasource="centerline">
	UPDATE messageInbox SET tread='yes' WHERE id=#url.id#
</cfquery>

<cfoutput>
<!--
<wwafcomponent>View Message from #longName#</wwafcomponent>
<wwafscript>
	alert('hello');
</wwafscript>
-->
</cfoutput>
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">View Message</h3>
<table width="100%">
	<tr>
		<td style="background-color:#CCCCCC">
			<img src="/graphics/email.png" align="absmiddle"> <a href="javascript:viewMailFolder('inbox')">Return to Inbox</a>
		</td>
	</tr>
</table>
<cfoutput>
<table width="100%" cellspacing="0">
	
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
		<!--- <cfset session.urlparm=#m.refJobID#>
		<cfinclude template="getJobLink.cfm"> --->
		</td>
		
	</tr>
	<tr>
		
		<td colspan="2">
		<div class="tMsg" style="height:350; width:80%;">
		<pre>#m.tbody#</pre>
		</div>
		</td>
	</tr>
</table>
</cfoutput>
