<cfquery name="cA" datasource="centerline">
	SELECT * FROM users WHERE username='#url.username#'
</cfquery>

<cfif #cA.RecordCount# EQ 0><span style="color:green">This login name is available for use!</span><cfelse><span style="color:red">This login name is already in use. Please choose another.</span></cfif>