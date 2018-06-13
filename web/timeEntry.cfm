<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Time Entry</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<cfquery name="gUsers" datasource="#session.datasource#">
		SELECT longName, id FROM users WHERE type=1 ORDER BY longName
	</cfquery>
	<cfquery name="qjnv" datasource="centerline">
	SELECT clsJobNumber, description FROM projects
	</cfquery>
	<script src="/Components/AJAX/ajax.js"></script>
<!--- 	<script language="javascript">
		var startDateCal;
		var endDateCal;
	</script> --->
	
	

			<div class="sidebarBlock" style="height:auto">
				
				<cfmodule template="/MyCL/components/Collapse.cfm" DivName="timeEntryBar" HeaderText="Time Entry" InitialState="inline" URL="/framework/sb_TimeEntry.cfm" SideImage="time_go.png">
				<cfmodule template="/MyCL/components/Collapse.cfm" DivName="searchBar" HeaderText="Project Locator" InitialState="none" URL="/search/components/search.cfm" SideImage="zoom.png">
				<div class="OptionsBox">
		  			<div class="OptionBoxHeading">Options</div>
						<label class="SettingsCheckBox"><input type="checkbox" name="KeepTabsOpen" id="KeepTabsOpen" align="absmiddle"/> Keep sidebars open until I close them</label>
					</div>
				</div>
			
			<div id="tabBars" class="tabBar">
						<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();">Timesheet View</a></span>
						
			</div>
			<div class="orderListBlock" id="tcTarget">
			
			</div>
			<div id="mapTarget" class="orderListBlock" style="display:none" align="center">
						<p class="VPLink">No map view defined for this page.</p>
					
					</div>
			<script language="javascript">
								var startDateCal = new calendar2(document.forms['dateSel'].elements['startDate']);
								var endDateCal = new calendar2(document.forms['dateSel'].elements['endDate']);
								
								<cfif #session.tcadmin# EQ "yes">
									loadWeekToCtls('startDate', 'endDate');
								<cfelse>
									loadWeekToCtls('startDateEmp', 'endDateEmp');
								</cfif>
								
							</script>
							<cfoutput>
								<cfswitch expression="#url.action#">
									<cfcase value="editTimesheet">
										<script language="javascript">
											AjaxLoadPageToDiv('tcTarget', 'tc/edit_ts.cfm?id=#url.id#')
										</script>
									</cfcase>
									<cfcase value="view">
									<script language="javascript">
									setListView;
									</script>
										<cfif #session.tcadmin# EQ "no">
											<script language="javascript">
												loadTimesheetView('tcTarget', #session.userid#, GetValue('startDateEmp'), GetValue('endDateEmp'), 'Open', '#session.tcadmin#', '');
											</script>
										<cfelse>
											<script language="javascript">
												loadTimesheetView('tcTarget', #session.userid#, GetValue('startDate'), GetValue('endDate'), 'Open', '#session.tcadmin#', '');
											</script>
										</cfif>
									</cfcase>
									<cfcase value="manageTaskCodes">
										<script language="javascript">
											AjaxLoadPageToDiv('tcTarget', 'tc/taskCodes.cfm')
										</script>
									</cfcase>
								</cfswitch>
								</cfoutput>

</body>
</html>
