<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Reset Password</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<form name="cp" action="cpsub.cfm" method="post">
	<table class="midTable" align="center" width="800">
		<tr>
			<th colspan="2">Change Password</th>
		</tr>
		<tr>
			<td>New Password:</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>Re-Enter to Confirm:</td>
			<td><input type="password" name="confirm" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="right"><input type="submit" class="normalButton" name="submit" value="Change Password" /></td>
		</tr>
	</table>
	</form>
</body>
</html>
