<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Center Line Services - [Home]</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />



						
						<cfif #session.loggedin# EQ "no">
						<table class="roundedTable" style="clear:both"><tr><td>
							<form name="login" action="login-submit.cfm" method="post">
								<table width="900">
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
							</td></tr></table>
						</cfif>
						
						<table class="splash" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td><img src="images/mast/b1.gif" width="180"/></td>
			<td><img src="images/mast/b2.gif" width="180"/></td>
			<td><img src="images/mast/b3.gif" width="180"/></td>
			<td><img src="images/mast/b4.gif" width="180"/></td>
			<td><img src="images/mast/b5.gif" width="180"/></td>
		</tr>
		<tr>
			<td><img src="images/mast/b6.gif" width="180"/></td>
			<td><img src="images/mast/b7.gif" width="180"/></td>
			<td><img src="images/mast/b8.gif" width="180"/></td>
			<td><img src="images/mast/b9.gif" width="180"/></td>
			<td><img src="images/mast/b10.gif" width="180"/></td>
		</tr>
	</table>
	
	<table class="newsTable" border="0">
		<tr>
			<td valign="top">
				<table class="newsInnerTable">
					<tr>
						<td>
							<cfmodule template="MyCL/components/BlockHeader.cfm" width="100%" text="About Center Line Services">
						</td>
					</tr>
	
					<tr>
						<td><p>Center Line Services takes its name from service itself.</p>
						<p>That's why we are constantly pursuing exciting and efficient ways to meet the needs of our clients.  Our Online Ordering Sytem has accomplished this goal in many ways.  Become a customer and order online, receive email notifications and send job related messages all at the convenience of your computer.  Order from anywhere in the world and view your product from any computer on the Internet.  Decrease your down time and increase your productivity today!</p></td>
					</tr>
			  </table>
			</td>
			
			<td valign="top">
				<table class="newsInnerTable">
					<tr>
						<td>
							<cfmodule template="MyCL/components/BlockHeader.cfm" width="100%" text="New Web Site Debut">
						</td>
					</tr>
					<tr>
						<td><p>Site News </p>
					    </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
			
			
</body>
</html>
