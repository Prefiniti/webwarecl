<cfquery name="setInitialPW" datasource="centerline">
	UPDATE users.
	SET		password='#url.password#',
    		last_pwchange=#CreateODBCDateTime(Now())#
	WHERE	id=#url.id#
</cfquery>

<cfset session.pwdiff=0>

<p style="color:red">Password set.</p>