<cfparam name="nextPN" default="">

<cfquery name="getHighPN" datasource="centerline">
	SELECT MAX(LEFT(clsJobNumber, 3)) AS JN FROM projects
</cfquery>

<cfoutput query="getHighPN">
	<cfset nextPN=#JN# + 1>
</cfoutput>

<cfset nextPN='#nextPN#-#DateFormat(Now(), "yymmdd")#'>

<cfoutput>#nextPN#</cfoutput>