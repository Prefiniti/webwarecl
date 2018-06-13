<!--
<wwafcomponent>New Timesheet</wwafcomponent>
<wwafpackage>Time Management</wwafpackage>
<wwaficon>time.png</wwaficon>
-->
<link href="../centerline.css" rel="stylesheet" type="text/css" />

<cfquery name="userinfo" datasource="centerline">
	SELECT * FROM users WHERE id=#URL.userid#
</cfquery>

<cfquery name="qJobNumbers" datasource="centerline">
	SELECT clsJobNumber, description FROM projects ORDER BY clsJobNumber DESC
</cfquery>

<cfswitch expression="#URL.action#">
	<cfcase value="view">
		View Timesheet
	</cfcase>
	<cfcase value="edit">
		Edit Timesheet
	</cfcase>
	<cfcase value="add">
		<form name="tsNew" action="tc/newts_sub.cfm" method="post">
			<cfoutput>
				<input type="hidden" name="submitID" id="submitID" value="#CreateUUID()#" />
				<input type="hidden" name="emp_id" id="emp_id" value="#url.userid#" />
			</cfoutput>
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">Create a New Timesheet</h3>
			<table width="100%">

				<tr>
					<td>Name:</td>
					<td><cfoutput>#userinfo.longname#</cfoutput></td>
				</tr>
				<tr>
					<td>Date:</td>
					<td><cfoutput><input type="text" name="date" id="date" value="#DateFormat(Now(), 'mm/dd/yyyy')#" /></cfoutput><a href="javascript:popupDate(AjaxGetElementReference('date'));"><img src="/graphics/date.png" align="absmiddle" border="0"/></a></td>
				</tr>
				<tr>
					<td>Project Number:</td>
					<td>
					  <p>
						<label>
						  <input type="radio" name="JobNumberType" value="Existing" checked/>
						  Choose From MyCL Projects </label>
						<div id="jobNumSel">
							<blockquote>
								<select name="JobNumSel" id="JobNumSel">
										<option value="WEB DEVEL">Web Development</option>
										<option value="SCAN DOCS">Document Scanning</option>
										<option value="ADMIN">Administration</option>
									<cfoutput query="qJobNumbers">
										<option value="#clsJobNumber#">#clsJobNumber#   #description#</option>
									</cfoutput>
								</select>	
							</blockquote>
						</div>
						
						
						<label>
						  <input type="radio" name="JobNumberType" value="New" />
						  Enter New Project Number</label>
						<blockquote>
							<input type="text" id="JobNumManual" name="JobNumManual" />
						</blockquote>
					  </p>					  </td>
				</tr>
				<tr>
					<td>Job Description:</td>
					<td><input type="text" id="jobDescription" name="jobDescription" /></td>
				</tr>
				<tr>
					<td>Start Time:</td>
					<td><input type="text" id="startTime" name="startTime" /></td>
				</tr>
				<tr>
					<!--function createTimesheet(emp_id, date, JobNumSel, JobNumManual, JobDescription, startTime, submitID, JobNumberType)-->
					<td>&nbsp;</td>
					<td align="right"><input type="button" class="normalButton" name="Submit" value="Create Timesheet" onclick="createTimesheet(GetValue('emp_id'), GetValue('date'), GetValue('JobNumSel'), GetValue('JobNumManual'), GetValue('jobDescription'), GetValue('startTime'), GetValue('submitID'), AjaxGetCheckedValue('JobNumberType'));" /></td>
				</tr>
			</table>
		</form>
	</cfcase>
</cfswitch>

