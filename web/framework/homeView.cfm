<!--
<wwafcomponent>MyCL Home</wwafcomponent>
<wwafsidebar>sb_Home.cfm</wwafsidebar>
<wwafdefinesmap>false</wwafdefinesmap>
<wwafpackage>WebWare.CL Base</wwafpackage>
<wwaficon>accept.png</wwaficon>
-->
<cfquery name="profile" datasource="centerline">
	SELECT * FROM users WHERE id=#url.calledByUser#
</cfquery>

<cfoutput query="profile">
    <table width="100%">
        <tr>
            <td rowspan="2" align="left" valign="top" width="150">
                <cfif #picture# EQ "">
                    <cfif #gender# EQ "M">
                        <img src="/graphics/genpicmale.png" width="150" height="150">
                    <cfelseif #gender# EQ "F">
                        <img src="/graphics/genpicfemale.png" width="150" height="150">
                    <cfelse>
                        <img src="/graphics/genpicmale.png" width="150" height="150">
                    </cfif>
                <cfelse>
                    <img src="/authentication/profile_images/#picture#" width="150" height="150">
                </cfif>
                
            </td>
            <td valign="top" align="right" style="background-color:##EFEFEF"><h3 align="right" style="font-family: 'Times New Roman', Times, serif; color:##3399CC; font-weight:lighter; font-size:24px; margin-top:3px; margin-bottom:0px; padding-botton:2px;">#longName#</h3><a href="javascript:editUser(#url.calledByUser#);">Edit My Profile</a></td>
        </tr>
        <tr>
          <td valign="top">
            <cfif #url.permissionLevel# EQ 0>
                <cfquery name="qryGetCustomerJobs" datasource="centerline">
                    SELECT * FROM projects WHERE clientID='#url.calledByUser#' AND rfp=0 ORDER BY status, substatus
                </cfquery>
                <cfquery name="qryGetRFP" datasource="centerline">
                	SELECT * FROM projects WHERE clientID='#url.calledByUser#' AND rfp=1
                </cfquery>
                <div class="homeHeader"><img src="graphics/calendar_view_day.png" align="absmiddle" /> Today's Alerts</div>
                <cfif qryGetCustomerJobs.RecordCount GT 0>
	                <cfmodule template="/scheduling/components/scheduleByJob.cfm" clsJobNumber="#qryGetCustomerJobs.id#">
                    
                    
                <cfelse>
                	
                    <cfif qryGetRFP.RecordCount GT 0>
                    	<div class="homeHeader"><img src="/graphics/page_green.png" align="absmiddle" /> Proposals</div>
                    	<div style="padding-left:30px;">
                        <cfmodule template="/workflow/components/listRFP.cfm" clientID="#url.calledByUser#">
                        </div>
                    <cfelse>
                        <h4 style="padding-left:30px;">You have not yet placed any orders with us.</h4>
                        <h4 style="padding-left:40px;">What would you like to do?</h5>
                        <ul style="padding-left:50px;">
                            <li><a href="javascript:AjaxLoadPageToDiv('tcTarget', '/workflow/components/surveyorderform.cfm');">Place my first order</a></li>
                            <li><a href="javascript:loadLiveHelp();">Speak with a customer service representative</a></li>
                            <li><a href="javascript:editUser(#url.calledByUser#);">Make changes to my account</a></li>
                        </ul>
                    </cfif>
                    
                </cfif>
                
                <div class="homeHeader"><img src="graphics/feed.png" align="absmiddle"/> Site News</div>
                <div style="padding-left:30px;">
                <cfmodule template="/news/components/newsView.cfm">
                </div>
            <cfelse>
                <div class="homeHeader"><img src="graphics/calendar_view_day.png" align="absmiddle" /> My Schedule</div>
                <div style="padding-left:30px;">
                    <cfmodule template="/scheduling/components/getSchedule.cfm" userid="#url.calledByUser#">
                </div>
                <div class="homeHeader"><img src="graphics/exclamation.png" align="absmiddle"/> Items Requiring Attention</div>
                <cfinclude template="/framework/components/itemAttention.cfm">
                <div class="homeHeader"><a href="http://www.centerlineservices.biz/news/rss.cfm" target="_blank"><img src="graphics/feed.png" align="absmiddle" border="0"/></a> Site News</div>
                <div style="padding-left:30px;">
                <cfmodule template="/news/components/newsView.cfm">
                </div>
            </cfif>
          </td>
      </tr>
    </table>
</cfoutput>