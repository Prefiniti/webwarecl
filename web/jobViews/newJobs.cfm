<!--
	<wwafcomponent>Process New Orders</wwafcomponent>
	<wwafpackage>Workflow Manager</wwafpackage>
<wwaficon>report.png</wwaficon>
-->

<cfparam name="RowNum" default="0">
<cfparam name="ColOdd" default="">
<cfparam name="ColColor" default="white">

<cfquery name="newJobs" datasource="centerline">
	SELECT * FROM projects WHERE viewed=0 AND stage=0 ORDER BY clientID
</cfquery>
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">Process New Orders</h3>
<table width="100%" cellpadding="3" cellspacing="0">
	<cfif #newJobs.recordcount# GT 0>

	<tr>
		<th align="left">Customer</th>
		<th align="left">Description</th>
		<th align="left">Project Type</th>
		<th align="left">Due Date</th>
		<th align="left"><strong></strong>Tools</th>
	</tr>
	</cfif>
	<cfif #newJobs.recordcount# EQ 0>
	<tr>
		<td align="center"><br /><br /><br /><p style="color:red">No new orders have been placed.</p><br />
		<p class="VPLink"><img src="graphics/report_go.png" align="absmiddle" /> <a href="javascript:AjaxLoadPageToDiv('tcTarget', 'jobViews/allIncomplete.cfm');"> View incomplete projects</a><br />
		<img src="/graphics/report_go.png" align="absmiddle" /> <a href="javascript:AjaxLoadPageToDiv('tcTarget', 'jobViews/allByCustomer.cfm');">View all projects</a></p><br /><br /><br /></td>
	</tr>
	</cfif>
	<cfoutput query="newJobs">
    <cfset RowNum=RowNum + 1>
		<cfset ColOdd=RowNum mod 2>
		
		<cfswitch expression="#ColOdd#">
			<cfcase value=1>
				<cfset ColColor="##EFEFEF">
			</cfcase>
			<cfcase value=0>
				<cfset ColColor="white">
			</cfcase>
		</cfswitch>
		<tr>
			<td style="background-color:#ColColor#"><cfmodule template="/jobViews/components/custNameByID.cfm" id="#clientID#"></td>
			<td style="background-color:#ColColor#">#description#</td>
			<td style="background-color:#ColColor#"><cfif ServiceType NEQ "">#ServiceType#<br /></cfif>#jobtype#</td>
			<td style="background-color:#ColColor#">#DateFormat(duedate, "mm/dd/yyyy")#</td>
			<td style="background-color:#ColColor#">
            	<img src="/graphics/zoom.png" align="absmiddle"> 
				<cfif rfp EQ 0>
                	<a href="javascript:AjaxLoadPageToDiv('tcTarget', '/workFlow/components/processOrder.cfm?id=#id#');">Process Order</a>
                    <cfif rfp_accepted EQ 1>
                    	&nbsp;- [RFP Accepted]<br />
                        <img src="/graphics/zoom.png" align="absmiddle"> <a href="javascript:AjaxLoadPageToDiv('tcTarget', '/workFlow/components/viewRFP.cfm?id=#id#&viewOnly=1');">View RFP</a>
                    </cfif>
                <cfelse>
                	<cfif rfp_processed EQ 0>
                		<a href="javascript:AjaxLoadPageToDiv('tcTarget', '/workFlow/components/processRFP.cfm?id=#id#');">Process RFP</a>
                    <cfelse>
                    	RFP Awaiting Customer Acceptance<br />
                        <img src="/graphics/zoom.png" align="absmiddle"> <a href="javascript:AjaxLoadPageToDiv('tcTarget', '/workFlow/components/viewRFP.cfm?id=#id#&viewOnly=1');">View RFP</a>
                    </cfif>
                </cfif>
            </td>
		</tr>
	</cfoutput>
			
	
</table>


