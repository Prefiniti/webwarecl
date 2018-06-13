<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Select Subdivision</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<cfquery name="qrySubs" datasource="#session.datasource#">
		SELECT * FROM subdivisions
	</cfquery>
	
	<table width="400" align="center" border="1">
		<tr>
			<th colspan="2">Select Subdivision</th>
		</tr>
		<tr>
			<td>
				Existing Subdivisions:
			</td>
			
			<td>
				<select name="subSel">
					<cfoutput query="qrySubs">
						<option value="#name#">
					</cfoutput>
				</select>
			</td>
		</tr>
	</table>
</body>

</html>
