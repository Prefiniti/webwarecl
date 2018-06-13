
<cfquery name="c" datasource="centerline">
	SELECT * FROM users WHERE id='#attributes.clientID#'
</cfquery>

<cfquery name="p" datasource="centerline">
	SELECT * FROM projects WHERE id='#attributes.id#'
</cfquery>

<cfoutput>

<cfmail to="#c.email#" from="donotreply@centerlineservices.biz" subject="Center Line Services - New Project File Posted" type="html">
	<h1>New Project File Posted</h1>
	<p>A new project file for your project #p.description# has been posted on the Center Line Services home page.</p>
	<p><strong>File Description:</strong> #attributes.longName#</p>
	<p><a href="http://www.centerlineservices.biz/datastore/projectfiles/#attributes.serverFile#">Click here to view</a></p>
</cfmail>

</cfoutput>
