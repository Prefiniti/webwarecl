<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Contact Us</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfoutput>
	<form action="contact-sub.cfm" method="post">
	<table width="800" class="midTable" align="center">
		<tr>
			<th colspan="2">Contact Us</th>
		</tr>
		<tr>
			<td>Your Name:</td>
			<td><input type="text" name="yourname" <cfif IsDefined("session.longname")> value="#session.longname#"</cfif> /></td>
		</tr>
		<tr>
			<td>Your Email Address:</td>
			<td><input type="text" name="email" <cfif IsDefined("session.email")> value="#session.email#"</cfif>/></td>
		</tr>
		<tr>
			<td>Subject:</td>
			<td><p>
			  <label>
			    <input type="radio" name="Subject" value="Account Request" />
			    Account Request</label>
			  <br />
			  <label>
			    <input type="radio" name="Subject" value="Other" checked/>
			    Other</label>
			  <br />
		    </p></td>
		</tr>
		<tr>
			<td>Message:</td>
			<td><textarea name="body" rows="10" cols="80"></textarea></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="right"><input type="submit" class="normalButton" name="submit" value="Send This Message" /></td>
		</tr>
	</table>
	</form>
	</cfoutput>
</body>
</html>
