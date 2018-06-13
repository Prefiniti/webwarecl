<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Add Company</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<table width="800" class="midTable" align="center">
		<tr>
			<td>
				<div id="leftBlock">
					<form name="acs" action="addcompany_sub.cfm" method="post">
					<table width="100%">
						<tr>
							<th colspan="2">Add Company</th>
						</tr>
						<tr>
							<td>Name:</td>
							<td><input name="name" type="text" size="50" /></td>
						</tr>
						<tr>
							<td>Address:</td>
							<td><textarea name="address" cols="50"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="submit" class="normalButton" name="Submit" value="Add Company" /></td>
						</tr>
					</table>
					</form>				
					
				</div>
				<br />
			</td>
		</tr>
	</table>
</body>
</html>
