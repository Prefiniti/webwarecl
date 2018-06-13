<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>MyCL Login</title>
<link rel="stylesheet" href="/style/cls.css" />
<style type="text/css">
	.leftImg
	{
	display: block;
	float: left;		
	padding-right: 20px;
	}
	.lb  
	{
	width:238px;
	border: 1px solid #CCCCCC;
	padding: 5px;
	}
</style>
</head>

<body>
	<div class="bodyWrapper">
	<br />
	<br />
	<table width="900">
		<tr>
		  <td width="600" valign="top">
		  <cfif #session.loggedin# EQ "yes">
		  <cflocation url="webwareBase.cfm" addtoken="no">
		  </cfif>
				<div class="leftImg"><img src="/graphics/workers.jpg" /></div>
				<h1>Welcome.</h1>

						<p>Center Line Services takes its name from service itself.</p>
						<p>That's why we are constantly pursuing exciting and efficient ways to meet the needs of our clients.  Our Online Ordering Sytem has accomplished this goal in many ways<a href="javascript:showDiv('hiddenLogin');">.</a>  Become a customer and order online, receive email notifications and send job related messages all at the convenience of your computer.  Order from anywhere in the world and view your product from any computer on the Internet.  Decrease your down time and increase your productivity today!</p>
			<h1>News</h1>
			<p class="newsView"><cfmodule template="/news/components/newsView.cfm"></p>
			
			</td>
			<td width="300" valign="top" align="center">
	            <cfif session.browserType NEQ "Microsoft Internet Explorer">
					<cfmodule template="/MyCL/components/BlockHeader.cfm" width="250" text="Log In">
                <cfelse>
                	<cfmodule template="/MyCL/components/BlockHeader.cfm" width="250" text="Legacy Browser Error">
                </cfif>
                                
				<!---<cfif session.browserType NEQ "Microsoft Internet Explorer">--->
	                <cfmodule template="authentication/components/Login.cfm" width="250" success="" siteid="MyCL">
				</div>
				<!---<cfelse>
                	<table width="250" style="border:1px solid silver">
                    	<tr>
                        	<td><strong>Legacy Browser Error</strong><br /><br />For security, compatibility, and performance reasons, WebWare.CL does not support Microsoft Internet Explorer and other non-compliant legacy browser platforms.<br /><br />Please download <a href="http://www.mozilla.com/en-US/firefox/">Mozilla Firefox</a> or <a href="http://browser.netscape.com/">Netscape Navigator</a></td>
                        </tr>
                    </table>
                </cfif>--->
    			<br />
				<br />
				<cfmodule template="/MyCL/components/BlockHeader.cfm" width="250" text="Get Started Now">
				<div align="left" class="lb">
				<p>The power of Prefiniti is just a few clicks away! Register for an account today, and increase your productivity with:</p>
				<ul>
				<li>Online orders</li>
				<li>Project tracking</li>
				<li>Digital drawing delivery</li>
				<li>Social networking</li>
				</ul>
				<p>Registration is easy! Just go to the <a href="http://webwarecl.prefiniti.com/appBase.cfm?contentBar=/authentication/components/register.cfm">registration page</a> and supply the requested information.</p>
				
			</td>
		</tr>
	</table>	
	
	</div>
	
</body>
</html>
