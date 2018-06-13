<!--
	<wwafcomponent>This Week's Timesheets</wwafcomponent>
<wwafpackage>Time Management</wwafpackage>
<wwaficon>time.png</wwaficon>
-->
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px; margin-bottom:0px; padding-botton:2px;">This Week's Timesheets</h3>
<br />
<cfmodule template="/controls/weekCalendar.cfm" viewer="/tc/components/tsDay.cfm" userid="#url.calledByUser#" showWeekend="false" startDate="firstDayOfWeek">
<div id="tsInfo" style="display:block;">
<p>No timesheet selected</p>
</div>