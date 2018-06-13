<!--
<wwafcomponent>View Timesheets</wwafcomponent>
-->

<link href="../centerline.css" rel="stylesheet" type="text/css">

<cfparam name="RowNum" default="0">
<cfparam name="ColOdd" default="">
<cfparam name="ColColor" default="white">

<cfparam name="hrsTotal" default="0">
<cfset hrsTotal="0">



<cfquery name="tcByUser" datasource="centerline">
	SELECT * FROM time_card WHERE
	<cfif #url.emp_id# NEQ "noUserFilter">
		emp_id=#url.emp_id# 
		AND
	</cfif>
	date>='#DateFormat(url.startDate, "yyyy/mm/dd")#' 
	AND date<='#DateFormat(url.endDate, "yyyy/mm/dd")#'
	<cfif #url.filter# NEQ "None">
		<cfswitch expression="#url.filter#">
			<cfcase value="Open">
				AND closed=0
			</cfcase>
			<cfcase value="Signed">
				AND closed=1
			</cfcase>
			<cfcase value="Approved">
				AND closed=2
			</cfcase>
		</cfswitch>
	</cfif>
	<cfif #url.jobNum# NEQ "">
		AND clsJobNumber='#url.jobNum#'
	</cfif>
	ORDER BY date
</cfquery>

<!---<cfquery name="tcByUser" datasource="centerline">
	SELECT * FROM time_card WHERE
	<cfif #url.emp_id# NEQ "noUserFilter">
		emp_id=#url.emp_id# 
		AND
	</cfif>
	date>='#DateFormat(url.startDate, "yyyy/mm/dd")#' 
	AND date<='#DateFormat(url.endDate, "yyyy/mm/dd")#'
	<cfif #url.filter# NEQ "None">
		<cfswitch expression="#url.filter#">
			<cfcase value="Open">
				AND closed=0
			</cfcase>
			<cfcase value="Signed">
				AND closed=1
			</cfcase>
			<cfcase value="Approved">
				AND closed=2
			</cfcase>
		</cfswitch>
	</cfif>
	<cfif #url.jobNum# NEQ "">
		AND clsJobNumber='#url.jobNum#'
	</cfif>
	
</cfquery>--->

<cfif #url.emp_id# NEQ "noUserFilter">
	<cfquery name="getUserName" datasource="centerline">
		SELECT longName FROM users WHERE id=#url.emp_id#
	</cfquery>
</cfif>
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">View Timesheets<span style="background-image:none;">

</span></h3>
<table width="100%" cellspacing="0">
	<tr>
		<th colspan="6" style="background-image:none;">
			&nbsp;<br />
			
				Timesheets for 
				<cfif #url.emp_id# NEQ "noUserFilter">
					<cfoutput>#getUserName.longName#</cfoutput>
				<cfelse>All users.
				</cfif> from 

				<cfoutput>#url.startDate# until #url.endDate# (#tcByUser.RecordCount# records)</cfoutput>
				<br />Filter Options: 
				<cfoutput>#url.filter#</cfoutput><br>
				<cfif #url.jobNum# NEQ "">Project Number: <cfoutput>#url.jobNum#</cfoutput></cfif>&nbsp;
        <br /></th>
	</tr>
	<tr>
		<th align="left">Date</th>
		<th align="left">Project No.</th>
		<th align="left">Description</th>
		<th align="left">Hrs.</th>
		<th align="left">Status</th>
		<th align="left">Tools</th>
	</tr>
	<cfoutput query="tcByUser">
		<cfset RowNum=RowNum + 1>
		<cfset ColOdd=RowNum mod 2>
		
		<cfswitch expression="#ColOdd#">
			<cfcase value=1>
				<cfset ColColor="silver">
			</cfcase>
			<cfcase value=0>
				<cfset ColColor="silver">
			</cfcase>
		</cfswitch>
		<tr>
			<td style="background-color:#ColColor#">#DateFormat(date, 'mm/dd/yyyy')#</td>
			<td style="background-color:#ColColor#">#clsJobNumber#</td>
			<td style="background-color:#ColColor#">#JobDescription#</td>
			<td style="background-color:#ColColor#">
				<span id="hrs_#RowNum#"><cfmodule template="components/hoursByTS.cfm" timecard_id="#id#"></span>
			</td>
			<td style="background-color:#ColColor#">
				<div id="stat_#id#">
					<cfmodule template="components/tcStatus.cfm" id="#id#">
				</div>
			</td>
			<td style="background-color:#ColColor#" nowrap>
				<img src="graphics/printer.png" align="absmiddle" /> <a href="tc/components/viewTimeCard.cfm?id=#id#" target="_blank">Print</a><br />
				<img src="graphics/time_go.png" align="absmiddle" /> <a href="javascript:AjaxLoadPageToDiv('tcTarget', 'tc/edit_ts.cfm?id=#id#')">Edit</a>
				
					<br />
					<img src="graphics/time_delete.png" align="absmiddle" /> <a href="javascript:deleteTimesheetConfirm('#id#', 'tcTarget')">Delete</a>
				
				
			</td>
		</tr>
		<tr>
			<td colspan="6" style="padding:0px;">
				<p style="font-size:xx-small"><img src="graphics/zoom.png" align="absmiddle" /> Full View: [<a href="javascript:showDiv('#id#_fv');">+</a>] [<a href="javascript:hideDiv('#id#_fv');">-</a>] 
				<cfif #closed# EQ 0> | <img src="graphics/text_signature.png" align="absmiddle" /> <a href="javascript:AjaxLoadPageToDiv('tcTarget', 'tc/sign.cfm?id=#id#')">Sign Timesheet</a>
				</cfif>
				<cfif #url.admin# EQ "yes">
					<cfif #closed# EQ 1>
					&nbsp;| <img src="graphics/accept.png" align="absmiddle" /> <a href="javascript:approveTimesheet(#id#, 'stat_#id#');">Approve Timesheet</a> | <img src="graphics/arrow_left.png" align="absmiddle" /> <a href="javascript:reverseTimesheet(#id#, 'stat_#id#');">Reverse Timesheet</a>
					</cfif>
				</cfif>	
				</p>
				
					<div id="#id#_fv" style="display:none;">
							<table border="0" cellpadding="3"><tr><td>
							<table border="1">
								<tr>
									<td>
										<cfmodule template="/tc/components/tcHeader.cfm" id="#id#"><br />
										<cfmodule template="/tc/components/lineItemsByTC.cfm" timecard_id="#id#"><br>
										<cfmodule template="/tc/components/tcFooter.cfm" id="#id#">
									</td>
								</tr>
							</table>
							</td></tr></table>
					</div>
					<hr />
			</td>
		</tr>
	</cfoutput>
</table>
<cfoutput>
<table width="100%">
	<tr>
    	<td align="left">
			<input type="button" class="normalButton" value="Total Hours for This Query" name="TotalHours" onclick="getTotalHours(#RowNum#);" />
		</td>
        <td align="right">
        	<div align="right" id="totalHours"></div>
        </td>
</cfoutput>

