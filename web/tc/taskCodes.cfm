<!--
	<wwafcomponent>Manage Task Codes</wwafcomponent>
<wwafpackage>Time Management</wwafpackage>
<wwaficon>time.png</wwaficon>
-->
<link href="../centerline.css" rel="stylesheet" type="text/css">

<cfparam name="RowNum" default="0">
<cfparam name="ColOdd" default="">
<cfparam name="ColColor" default="white">

<cfquery name="getTaskCodes" datasource="centerline">
	SELECT * FROM task_codes ORDER BY task_id
</cfquery>
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">Manage Task Codes</h3>
<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th>Task Code</th>
		<th>Item</th>
		<th>Description</th>
		<th>Rate</th>
		<th>Charge Type</th>
		<th>Tools</th>
	</tr>
	
	<cfoutput query="getTaskCodes">
		<cfset RowNum=RowNum + 1>
		<cfset ColOdd=RowNum mod 2>
		
		<cfswitch expression="#ColOdd#">
			<cfcase value=1>
				<cfset ColColor="silver">
			</cfcase>
			<cfcase value=0>
				<cfset ColColor="white">
			</cfcase>
		</cfswitch>
		<tr>
			<td style="background-color:#ColColor#">#task_id#</td>
			<td style="background-color:#ColColor#">#item#</td>
			<td style="background-color:#ColColor#">#description#</td>
			<td style="background-color:#ColColor#">#rate#</td>
			<td style="background-color:#ColColor#">#charge_type#</td>
			<td style="background-color:#ColColor#" nowrap><img src="graphics/page_edit.png"> <a href="javascript:AjaxLoadPageToDiv('tcTarget', 'tc/taskCodeEdit.cfm?id=#id#')">Edit</a><br>
			<img src="graphics/page_delete.png"> <a href="javascript:AjaxLoadPageToDiv('tcTarget', 'tc/taskCodeDelete.cfm?id=#id#')">Delete</a>
			</td>
		</tr>
	</cfoutput>
</table>
<br>
<form name="addTaskCode" id="addTaskCode" action="tc/addTask_sub.cfm" method="post">
	<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
		  <th colspan="2">Add Task Code</th>
	  </tr>
		<tr>
			<td>Task Code</td>
			<td><input type="text" name="task_id"></td>
		</tr>
		<tr>
			<td>Item</td>
			<td><input type="text" name="item"></td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" name="description"></td>
		</tr>
		<tr>
			<td>Rate</td>
			<td><input type="text" name="rate"></td>
		</tr>
		<tr>
			<td>Charge Type</td>
			<td>
				<select name="charge_type">
					<option value="Hour">Hour</option>
					<option value="Layer">Layer</option>
					<option value="Day">Day</option>
					<option value="Unit">Unit</option>
					<option value="Category">Category</option>
					<option value="Sheet">Sheet</option>
				</select>			</td>
		</tr>
		<tr>
		  <td colspan="2" align="right"><input type="button" class="normalButton" name="Submit" value="Add Task Code" onclick="AjaxSubmitForm(AjaxGetElementReference('addTaskCode'), '/tc/addTask_sub.cfm', 'tcTarget');"></td>
	  </tr>
	</table>
</form>