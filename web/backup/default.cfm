<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Center Line Services - [Home]</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />

<!---begin ad rotator--->
 <!--
// == This Script Free To Use Providing This Notice Remains == //                                                                 
// == This Script Has Been In The http://www.DesignerWiz.com Javascript Public Archive Library == // 
// == NOTICE: Though This Material May Have Been In A Public Depository, Certain Author Copyright Restrictions May Apply == //
--><script language="JavaScript">
<!-- Hide from old browsers
var i = 1;
banner1= new Image();
banner1.src = "../graphics/orderonline.jpg";
banner2 = new Image();
banner2.src = "../graphics/PlugIn.gif"; //you may add as many as needed
links = new Array
links[1] = "jobRequest.cfm"
links[2] = "jobRequest.cfm" //be sure to ad numbers consecutively
description = new Array
description[1] = ""
description[2] = "" //be sure to ad message numbers consecutively 
function startTime(){
var time= new Date();
hours= time.getHours();
mins= time.getMinutes();
secs= time.getSeconds();
closeTime=hours*3600+mins*60+secs;
closeTime+=15;	// How many seconds until the next banner rotation
Timer();
}
function Timer(){
var time= new Date();
hours= time.getHours();
mins= time.getMinutes();
secs= time.getSeconds();
curTime=hours*3600+mins*60+secs
if (curTime>=closeTime){
if (i < 2){	// The number 2 is the amount of banners that you have above - adjust accordingly
i++;
document.banner.src = eval("banner" + i + ".src");
}
else{
i = 1;
document.banner.src = eval("banner" + i + ".src");
}
startTime();
}
else{
window.setTimeout("Timer()",1000)}
}
function clickLink(){
top.location = links[i]
}
function descript(){
window.status = description[i]
}
// -->
</script>
<!---end ad rotator--->


</head>

<body onLoad="startTime();">
	<table width="800" align="center" cellspacing="0" class="midTable">
	<tr>
		<td width="340" valign="top">
			<cfinclude template="includes/pictabl.cfm" >
		</td>
		<td valign="top" >
			
			<img src="../graphics/Header.jpg" />
			<table width="100%">
					<tr align="right">
						<td>
						
						<cfif #session.loggedin# EQ "no">
						<div class="logbox">
							<form name="login" action="login-submit.cfm" method="post">
								<table width="100%">
									<tr>
									<td class="logbox"><strong>Client Login</strong></td>
			<td class="logbox">Username:</td>
			<td class="logbox">
			<cfoutput>
			<cfif not IsDefined("cookie.rememberMe")>
				<cfcookie name="rememberMe" value="false">
			</cfif>
				
				<input type="text" name="username" <cfif #cookie.rememberMe# EQ "true">value="#cookie.username#"</cfif>/><input type="checkbox" name="rememberMe" <cfif #cookie.rememberMe# EQ "true">checked</cfif>/>Remember me
			</cfoutput>
			</td>
			<td class="logbox">Password:</td>
			<td class="logbox"><input type="password" name="password" <cfif #cookie.rememberMe# EQ "true">value="#cookie.password#"</cfif>/></td>
		
			<td class="logbox"></td>
			<td class="logbox" align="right"><input type="submit" class="normalButton" value="Submit" name="Submit" /></td>
			</tr>
								</table>
							</form>
							</div>
						</cfif>
						</td>
						
					</tr>
				</table>
			
			<br />
			<table width="100%" cellpadding="10" cellspacing="0">
				<tr>
					<td width="35%"><p class="introCopy">Center Line Services takes its name from service   itself.<br />
					  <br />
					  That's why we are constantly   pursuing exciting and efficient ways to meet the needs of our clients.&nbsp; Our   Online Ordering Sytem has accomplished this goal in many ways.&nbsp; Become a   customer and order online, receive email notifications and send job related   messages all at the convenience of your computer.&nbsp; Order from anywhere in the   world and view your product from any computer on the Internet.&nbsp; Decrease your   down time and Increase your productivity today!<br />
					  <br />
					  We have created a company   that better enables your industry to meet the demands of our developing   community.</p>
				  </td>
					<td width="65%">
						<a href="" onClick="clickLink(); return false;" onMouseOver="descript(); return true;" onMouseOut="window.status=''"><img src="../graphics/orderonline.jpg" border=0 name="banner"></a>
					</td>
		    </table>
			
		</td>
	</tr>
	</table>
</body>
</html>
