<style type="text/css">
	.loginTable {
	font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
	border: 1px solid #CCCCCC;
	}
	
	.loginTable td {
	padding-left: 5px;	
	padding-right: 5px;
	padding-bottom: 5px;
	padding-top:5px;
	}
	
</style>

<cfquery name="SiteInfo" datasource="sites">
	SELECT * FROM Sites WHERE SiteID='#attributes.siteid#'
</cfquery>

<cfquery name="getStatus" datasource="centerline">
	SELECT * FROM config
</cfquery>

<cfif not IsDefined("cookie.rememberMe")>
	<cfcookie name="rememberMe" value="false">
</cfif>

<cfoutput>
	<cfform name="login" action="/login-submit.cfm">
		<cfif IsDefined("url.redir")>
			<input type="hidden" name="doRedirect" value="true" />
			<input type="hidden" name="redir" value="#url.redir#" />
		<cfelse>
		  	<input type="hidden" name="doRedirect" value="false" />
		</cfif>
		<input type="hidden" name="siteid" value="#attributes.siteid#">
	    <table class="loginTable" width="#attributes.width#" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td>Site:</td>
			<td colspan="2" style="color:blue;">#SiteInfo.SiteName#</td>
		  </tr>
		  <tr>
		  	<td>Site Status:</td>
			<td colspan="2">
				<cfswitch expression="#getStatus.maintenance#">
					<cfcase value="0">
						<font color="green">Normal<br /></font>
					</cfcase>
					<cfcase value="1">
						<font color="red">Undergoing maintenance<br /></font>
					</cfcase>
				</cfswitch>
				
				<cfswitch expression="#getStatus.logins_disabled#">
					<cfcase value="0">
						<font color="green">Sign-in enabled</font>
					</cfcase>
					<cfcase value="1">
						<font color="red">Sign-in disabled</font>
					</cfcase>
				</cfswitch>
				
			</td>
		   </tr>

		  
          <tr>
            <td>Username:</td>
            <td colspan="2" align="right"><input type="text" name="UserName" <cfif #cookie.rememberMe# EQ "true">value="#cookie.username#"</cfif>></td>
          </tr>
          <tr>
            <td>Password:</td>
            <td colspan="2" align="right"><input type="password" name="Password" <cfif #cookie.rememberMe# EQ "true">value="#cookie.password#"</cfif>><br /><input type="checkbox" name="rememberMe" <cfif #cookie.rememberMe# EQ "true">checked</cfif>/>Remember me</td>
          </tr>
          <tr>
		  	<td style="font-size:xx-small">No account? <a href="/appBase.cfm?sideBar=Register&contentBar=/authentication/components/register.cfm">Register.</a></td>
            <td align="right"><a href="/OneKey/default.cfm"><img src="http://www.clogic-int.com/OneKey/images/onekey-small.gif" border="0"/></a></td>
            <td align="right"><input type="submit" class="normalButton" name="Submit" value="Log In" /></td>
          </tr>
        </table>
	</cfform>
</cfoutput>