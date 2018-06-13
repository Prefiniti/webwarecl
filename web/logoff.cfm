
	<cfparam name="suid" default="">
	<cfparam name="sln" default="">
	
	<cfquery name="eventUsers" datasource="centerline">
		SELECT * FROM users
	</cfquery>
	
	<cfoutput query="eventUsers">
		<cfquery name="genLoginEvent" datasource="centerline"> 
			INSERT INTO rt_events (eventText, targetUser, viewed, timestamp) VALUES
			('#session.longName# has signed off.', #id#, 0, #CreateODBCDateTime(Now())#)
		</cfquery>
	</cfoutput>
	<cfquery name="setOffline" datasource="centerline">
		UPDATE users SET online=0 WHERE id=#session.userid#
	</cfquery>
<cfset suid=session.userid>
<cfset sln=session.longname>
	<cfset session.loggedin="no">
	<cfset session.username="">
	<cfset session.longname="">
	<cfset session.userid="">

	<cfif IsDefined("url.close")>
		<cfoutput>
		<script language="javascript">
			alert("WebWare.CL is now exiting.");
			window.close();
		</script>
		</cfoutput>

	<cfelse>
		<cflocation url="default.cfm" addtoken="no">
	</cfif>
