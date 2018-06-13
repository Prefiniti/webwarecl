<cfif #session.loggedin# EQ "yes">
	<cfswitch expression="#session.usertype#">
		<cfcase value="0">	<!---customer--->
			<cflocation url="customer-home.cfm" addtoken="no">
		</cfcase>
		<cfcase value="1">
			<cflocation url="mycl-emp.cfm" addtoken="no">
		</cfcase>
	</cfswitch>
<cfelse>
	<cflocation url="default.cfm">
</cfif>