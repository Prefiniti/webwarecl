<cfquery name="getFromAddress" datasource="centerline">
	SELECT * FROM users WHERE smsnumber='#attributes.from#'
</cfquery>

<cfparam name="cid" default="">

<cfif #UCase(Left(attributes.project, 4))# EQ "CONF">
	<cfset cid="#Mid(attributes.project, 6, 6)#">
	
	<cfquery name="getConf" datasource="centerline">
		SELECT * FROM users WHERE sms_conf='#UCase(cid)#'
	</cfquery>
	
	<cfquery name="udSMS" datasource="centerline">
		UPDATE users SET smsnumber='#attributes.from#' WHERE id=#getConf.id#
	</cfquery>
	
	<cfoutput><cfmail from="sms@centerlineservices.biz" to="#attributes.from#" subject="WebWare.CL Text Messaging Setup">Congratulations, #getConf.longName#! Your WebWare.CL account is now set up to receive SMS notifications.</cfmail></cfoutput>
	
<cfelseif #ucase(attributes.project)# EQ "LIST">
	<cfmodule template="/smsResponder/getProjectListy.cfm" id="#getFromAddress.id#" from="#attributes.from#" longName="#getFromAddress.longName#" type="#getFromAddress.type#">
<cfelse>
	
	<cfquery name="gP" datasource="centerline">
		SELECT * FROM projects WHERE clsJobNumber='#attributes.project#' AND clientID='#getFromAddress.id#'
	</cfquery>
	
	
	
	<cfif #gP.RecordCount# EQ 0>
		<cfoutput>
		<cfmail to="#attributes.from#" from="sms@centerlineservices.biz" subject="Center Line Services SMS - #getFromAddress.longName#">No such project</cfmail>
		</cfoutput>
	<cfelse>
		<cfoutput>
		<cfmail to="#attributes.from#" from="sms@centerlineservices.biz" subject="Center Line Services SMS - #getFromAddress.longName#">#Chr(13)##Chr(10)##Chr(13)##Chr(10)#Project #attributes.project#:#Chr(13)##Chr(10)#
			<cfif #gP.status# EQ 0>Incomplete<cfelse>Complete</cfif> [#gP.SubStatus#]#Chr(13)##Chr(10)#Due Date: #DateFormat(gP.duedate, "mm/dd/yyyy")##Chr(13)##Chr(10)##gP.address##Chr(13)##Chr(10)##gP.city#, #gP.state# #gP.zip#
		</cfmail>
		</cfoutput>
	</cfif>
</cfif>