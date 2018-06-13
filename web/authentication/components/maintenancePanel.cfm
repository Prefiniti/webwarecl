<!--
<wwafcomponent>Maintenance Panel</wwafcomponent>
-->

<cfquery name="maint" datasource="centerline">
	SELECT * FROM config
</cfquery>

<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px; margin-bottom:0px; padding-botton:2px;">Site Maintenance</h3>

<a href="/debug.cfm">View Debugging Information</a>
	

<div style="width:100%; padding-left:30px;">
<br>
	<label><input type="checkbox" id="maintenance" onclick="setMaintenance(IsChecked('maintenance'))" <cfif #maint.maintenance# EQ 1>checked</cfif>>Site is undergoing maintenance</label><br>
	<label><input type="checkbox" id="logins_disabled" onclick="setLoginsDisabled(IsChecked('logins_disabled'))" <cfif #maint.logins_disabled# EQ 1>checked</cfif>>Disable sign-in</label><br><br />
	<label>Page testing: <input type="text" id="pageTest" /></label><input type="button" onclick="AjaxLoadPageToDiv('tcTarget', GetValue('pageTest'));" value="Load to Content Bar"/><input type="button" onclick="AjaxLoadPageToDiv('sbTarget', GetValue('pageTest'));" value="Load to Sidebar"/>
	
	
	
	
</div>

<div id="userActionTarget">

</div>
