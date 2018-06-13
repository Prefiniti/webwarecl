
<cfquery name="odc_cust" datasource="#session.datasource#">
	SELECT clsJobNumber FROM projects WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) > duedate AND SubStatus <> "Closed" AND clientID='#session.userid#';
</cfquery>

	<cfquery name="qryGetCustomerJobs" datasource="#session.datasource#">
		SELECT * FROM projects WHERE clientID='#session.userid#' ORDER BY status, substatus
	</cfquery>

	<cfquery name="profile" datasource="#session.datasource#">
		SELECT * FROM users WHERE id=#session.userid#
	</cfquery>
	
	<cfparam name="RowNum" default="0">
	<cfparam name="ColOdd" default="">
	<cfparam name="ColColor" default="white">
				<div class="sidebarBlock" style="height:auto;">
					<cfoutput>
					<table width="100%">
						<tr><th>Customer Summary</th></tr>
						<tr>
							<td><img src="graphics/cart.png" align="absmiddle" /> <font color="blue">#qryGetCustomerJobs.RecordCount# orders on record</font></td>
						</tr>
						<tr>
							<td><img src="graphics/clock.png" align="absmiddle" /> <font color="red">#odc_cust.RecordCount# orders are past due</font></td>
						</tr>
						<tr>
							<td><img src="graphics/cart_add.png" align="absmiddle" /> <a href="jobRequest.cfm">Place New Order</a></td>
						</tr>
					</table>
					</cfoutput>
				<cfmodule template="/MyCL/components/Collapse.cfm" DivName="searchBar" HeaderText="Project Locator" InitialState="inline" URL="/search/components/search.cfm" SideImage="zoom.png">
				
			
							<div class="OptionsBox">
		  						<div class="OptionBoxHeading">Options</div>
									<label class="SettingsCheckBox"><input type="checkbox" name="KeepTabsOpen" id="KeepTabsOpen" align="absmiddle"/> Keep sidebars open until I close them</label>
							</div>
						
				</div>
				<div id="tabBars" class="tabBar">
						<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();"><span id="documentName">MyCL Home</span></a></span>
						
					</div>
				<div class="orderListBlock" id="tcTarget">
					
						<table width="100%">
							<cfoutput query="profile">
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
								<td valign="top" align="right" style="background-color:##CCCCCC"><h3 align="right" style="font-family: 'Times New Roman', Times, serif; color:##3399CC; font-weight:lighter; font-size:24px; margin-top:3px; margin-bottom:0px; padding-botton:2px;">#longName#</h3><a href="javascript:editUser(#session.userid#);">Edit My Profile</a></td>
							</tr>
							</cfoutput>
							<tr>
								<td><div class="homeHeader"><img src="graphics/calendar_view_day.png" align="absmiddle" /> Today's Alerts</div>
									<cfoutput query="qryGetCustomerJobs">
										<cfmodule template="/scheduling/components/scheduleByJob.cfm" clsJobNumber="#id#">
									</cfoutput>
									
									<div class="homeHeader"><img src="graphics/feed.png" align="absmiddle"/> Site News</div>
									<div style="padding-left:30px;">
									<cfmodule template="news/components/newsView.cfm">
									</div>
								</td>
							</tr>
							
									
						</table>
					
				</div>
				<br />
				
				<cfoutput>
				<script language="javascript">
					//AjaxLoadPageToDiv('tcTarget', 'jobViews/priorityCustomer.cfm?clientid=#session.userid#');
				</script>
				</cfoutput>

			
