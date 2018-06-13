<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Compose Message</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript">
<!--
function formSubmit ( selectedtype )
{
  document.newmail.submitType.value = selectedtype ;
  document.newmail.submit() ;
}
-->
</script>
</head>

<body>
	<cfquery name="usr" datasource="#session.datasource#">
		SELECT * FROM users
	</cfquery>
	<cfquery name="jobs" datasource="#session.datasource#">
		SELECT id, clsJobNumber FROM projects WHERE clsJobNumber != '' ORDER BY clsJobNumber
	</cfquery>
	<form name="newmail" action="sendmail.cfm" method="post">
	<cfoutput>
	
	<input type="hidden" name="submitType" value="Submit" />
	<input type="hidden" name="fromuser" value="#session.userid#" />
	<input type="hidden" name="date" value="#Now()#" />
	<input type="hidden" name="read" value="no" />
	</cfoutput>
	<table width="800" class="midTable" align="center" cellpadding="8">
		<tr>
		  <td colspan="2" valign="top" bgcolor="#CCCCCC" class="tbBack"><div class="button"><a href="javascript:formSubmit('Submit')">Send Message</a> <img src="graphics/email_go.png" align="absmiddle" /></div></td>
	  </tr>
		<tr>
			<td valign="top" width="30%"><img src="graphics/user.png" align="absmiddle"/> Recipient:</td>
			<td width="70%">
				<select name="touser">
					<cfoutput query="usr">
						<option value="#id#">#longName#</option>
					</cfoutput>
			  	</select>			</td>
		</tr>
		<tr>
			<td valign="top" width="30%"><img src="graphics/email_edit.png" align="absmiddle"/> Subject:</td>
			<td valign="top" width="70%"><input name="subject" type="text" size="80" /></td>
		</tr>
		<tr>
		  <td valign="top"><img src="graphics/wrench.png" align="absmiddle" /> Reference Job:</td>
		  <td valign="top"><select name="jobid">
					<cfoutput query="jobs">
						<option value="#id#">#clsJobNumber#</option>
					</cfoutput>
			  	</select></td>
	  </tr>
		<tr>
			<td valign="top" width="30%"><img src="graphics/email.png" align="absmiddle"/> Body:</td>
			<td valign="top" width="70%"><textarea name="bodyV" cols="78" rows="20"></textarea></td>
		</tr>
	</table>
	</form>
</body>
</html>
