<cfmodule template="/authentication/components/checkLogin.cfm" loggedIn="#session.loggedin#" redirPage="#cgi.script_name#?#cgi.QUERY_STRING#">

<cfoutput>#cgi.script_name#?#cgi.QUERY_STRING#</cfoutput>