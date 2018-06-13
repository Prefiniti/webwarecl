<cfquery name="cn" datasource="centerline">
	SELECT company FROM users WHERE id=#attributes.id#
</cfquery>

<cfmodule template="/jobViews/components/companyByCompanyID.cfm" id="#cn.company#">