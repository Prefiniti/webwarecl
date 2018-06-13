<cfquery name="projectInfo" datasource="centerline">
	SELECT * FROM projects WHERE id=#url.id#
</cfquery>
<cfquery name="gAU" datasource="centerline">
	SELECT * FROM users WHERE type=1
</cfquery>

<table width="100%">
	<tr>
		<th colspan="2">Project Overview </th>
	</tr>
	<tr>
		<td><strong>Client:</strong></td>
		<td><cfmodule template="/jobViews/components/companyByClientIDMenu.cfm" id="#projectInfo.clientid#"></td>
	</tr>
	
	<tr>
		<td><strong>Ordered By:</strong></td>
		<td><cfmodule template="/jobViews/components/custNameByIDMenu.cfm" id="#projectInfo.clientid#"></td>
	</tr>
	<tr>
		<td><strong>Description:</strong></td>
		<td><cfoutput>#projectInfo.description#</cfoutput></td>
	</tr>
	<tr>
		<td><strong>Project Number:</strong></td>
		<td>
			<div id="jobNumRO" style="display:inline">
				<span id="jnView"><cfoutput><cfif #projectInfo.clsJobNumber# EQ "">[None Assigned]</cfif>#projectInfo.clsJobNumber#</span> <cfif #url.permissionLevel# EQ 1><a href="javascript:editProjectNumber();"><img src="graphics/pencil_go.png" border="0" align="absmiddle" /></a></cfif></cfoutput>
			</div>
			<div id="jobNumRW" style="display:none">
				<cfoutput><input type="text" class="inputText" value="#projectInfo.clsJobNumber#" id="jobNumEdit"/> <a href="javascript:saveProjectNumber(#url.id#, GetValue('jobNumEdit'));"><img src="/graphics/database_save.png" border="0"/></a></cfoutput>
			</div>
		</td>
	</tr>
	<tr>
		<td><strong>Client Project No.:</strong></td>
		<td><cfoutput>#projectInfo.clientJobNumber#</cfoutput></td>
	</tr>
	<tr>
		<td><strong>Project Type:</strong></td>
		<td><cfoutput>#projectInfo.jobtype#</cfoutput></td>
	</tr>
	<tr>
		<td><strong>Order Placed:</strong></td>
		<td><cfoutput>#DateFormat(projectInfo.ordered_date, 'mm/dd/yyyy')#</cfoutput></td>
	</tr>
	<tr>
		<td ><strong>Due Date:</strong></td>
		<td ><cfoutput>#DateFormat(projectInfo.duedate, 'mm/dd/yyyy')#</cfoutput></td>
	  </tr>	
	 <tr>
		<td><strong>Project Status:</strong></td>
		<td><cfoutput><cfif #projectInfo.status# EQ 0>Incomplete<cfelse>Complete</cfif> <cfif #projectInfo.SubStatus# NEQ ""><br>[#projectInfo.SubStatus#]</cfif></cfoutput></td>
	</tr>	
	<cfif url.permissionLevel EQ 1>
		<tr>
			<td>Drafter:</td>
			<td>
				<span id="cur_drafter">
				<cfoutput>
					<cfif projectInfo.drafter_id NEQ "">
						<cfmodule template="/jobViews/components/custNameByID.cfm" id="#projectInfo.drafter_id#"> <br /><a href="javascript:showDiv('drafterSelect');" style="color:blue;">Change Drafter</a>
					<cfelse>
						[No drafter assigned] <br /><a href="javascript:showDiv('drafterSelect');"  style="color:blue;">Assign Drafter</a>
					</cfif>
				</cfoutput>
				</span>
				<div id="drafterSelect" style="display:none;">
					<select name="drafter" id="drafter" <cfoutput>onchange="assignDrafter(#projectInfo.id#, GetValue('drafter'));"</cfoutput>>
						<cfoutput query="gAU">
							<option value="#id#">#longName#</option>
						</cfoutput>
					</select>
				</div>
			</td>
		</tr>
		<tr>
			<td>Surveyor:</td>
			<td>
				<span id="cur_surveyor">
				<cfoutput>
					<cfif projectInfo.surveyor_id NEQ "">
						<cfmodule template="/jobViews/components/custNameByID.cfm" id="#projectInfo.surveyor_id#"> <br /><a href="javascript:showDiv('surveyorSelect');" style="color:blue;">Change Surveyor</a>
					<cfelse>
						[No surveyor assigned] <br /><a href="javascript:showDiv('surveyorSelect');"  style="color:blue;">Assign Surveyor</a>
					</cfif>
				</cfoutput>
				</span>
				<div id="surveyorSelect" style="display:none;">
					<select name="surveyor" id="surveyor" <cfoutput>onchange="assignSurveyor(#projectInfo.id#, GetValue('surveyor'));"</cfoutput>>
						<cfoutput query="gAU">
							<option value="#id#">#longName#</option>
						</cfoutput>
					</select>
				</div>
			</td>
		</tr>
	</cfif>
	  <cfif #projectInfo.status# EQ 0>
	<tr>
		<td colspan="2">Project has been open for <strong><cfoutput>#DateDiff("d", projectInfo.ordered_date, Now())#</cfoutput> days.</strong></td>
		</tr>
		<tr>
		<td colspan="2">
		<cfif #DateDiff("d", Now(), projectinfo.duedate)# GT 1>
		You have <strong><cfoutput>#DateDiff("d", Now(), projectinfo.duedate)#</cfoutput> days remaining</strong> to complete this project on time.
		<cfelseif #DateDiff("d", Now(), projectinfo.duedate)# EQ 0>
		You have <strong><cfoutput>#DateDiff("h", Now(), projectinfo.duedate)#</cfoutput> hours remaining</strong> to complete this project on time.
		<cfelse>
        <span style="color:red;">This project is past due.</span>
		</cfif>
		
		</td>
		</tr>
	</cfif>
</table>

<table width="100%">
	<tr>
		<th>Project Tools</th>
	</tr>
	<tr>
		<td><cfoutput>
        <img src="/graphics/zoom.png" align="absmiddle"> <a href="javascript:AjaxLoadPageToDiv('tcTarget', '/workFlow/components/viewRFP.cfm?id=#url.id#&viewOnly=1');">View original proposal</a><br /></cfoutput>
		<cfif #url.permissionLevel# EQ 1>
			<cfoutput><img src="/graphics/delete.png" align="middle" /> <a href="javascript:deleteProject('#url.id#')">Delete this project</a><br /></cfoutput>
		</cfif>
<img src="/graphics/printer.png" align="middle"/> <cfoutput><a href="javascript:viewPrintable('#url.id#')">View printable order</a></cfoutput><br />

<cfoutput><img src="/graphics/database_go.png" align="middle" /> <a href="javascript:showFileBrowser(#projectInfo.clientID#, #projectInfo.id#)">Browse my files</a></cfoutput><br />
<cfif #url.permissionLevel# EQ 1>
	<!--function loadTimesheetView(target, emp_id, startDate, endDate, filter, admin, jobNum)-->
	<cfoutput><img src="/graphics/time_go.png" align="middle"/> <a href="javascript:loadTimesheetView('tcTarget', #url.calledByUser#, '1/1/1980', '12/31/2999', 'none', 'no', '#projectInfo.clsJobNumber#')">My timesheets for this project</a></cfoutput><br />
	<cfif #url.istcadmin# EQ "yes">
		<cfoutput><img src="/graphics/time_go.png" align="middle"/> <a href="javascript:loadTimesheetView('tcTarget', 'noUserFilter', '1/1/1980', '12/31/2999', 'none', 'no', '#projectInfo.clsJobNumber#')">All timesheets for this project</a></cfoutput><br />
	</cfif>
</cfif>

		</td>
	</tr>
</table>
<cfif #url.permissionLevel# EQ 1>
	<cfmodule template="/MyCL/components/Collapse.cfm" DivName="projectStatus" HeaderText="Project Status" InitialState="none" URL="/workFlow/components/projectStatus.cfm" SideImage="wrench.png">
</cfif>
<!---<cfmodule template="/MyCL/components/Collapse.cfm" DivName="fileList" HeaderText="Project Files" InitialState="none" URL="/contentManager/components/fileList.cfm" SideImage="application_view_list.png">--->
<cfmodule template="/MyCL/components/Collapse.cfm" DivName="fileUpload" HeaderText="File Upload " InitialState="none" URL="/contentManager/components/fileUploadBox.cfm" SideImage="folder_add.png">
<cfmodule template="/MyCL/components/Collapse.cfm" DivName="searchBar" HeaderText="Project Locator" InitialState="none" URL="/search/components/search.cfm" SideImage="zoom.png">
<cfif #url.permissionLevel# EQ 1>
	<cfmodule template="/MyCL/components/Collapse.cfm" DivName="timeEntryBar" HeaderText="Time Entry" InitialState="none" URL="/framework/sb_TimeEntry.cfm" SideImage="time_go.png">
</cfif>



<div class="OptionsBox">
	<div class="OptionBoxHeading">Options</div>
	<label class="SettingsCheckBox"><input type="checkbox" name="KeepTabsOpen" id="KeepTabsOpen" align="absmiddle" /> Keep sidebars open until I close them</label>
</div>