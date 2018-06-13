<link href="../centerline.css" rel="stylesheet" type="text/css">
<cfquery name="getTaskCode" datasource="centerline">
	SELECT * FROM task_codes WHERE id=#url.id#
</cfquery>

<cfoutput query="getTaskCode">
<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:##3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">Make Changes to a Task Code</h3>
<form name="addTaskCode" action="tc/editTask_sub.cfm?id=#url.id#" method="post">
	<table width="100%" cellpadding="0" cellspacing="0">

		<tr>
			<td>Task Code</td>
			<td><input type="text" name="task_id" value="#task_id#"></td>
		</tr>
		<tr>
			<td>Item</td>
			<td><input type="text" name="item" value="#item#"></td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" name="description" value="#description#"></td>
		</tr>
		<tr>
			<td>Rate</td>
			<td><input type="text" name="rate" value="#rate#"></td>
		</tr>
		<tr>
			<td>Charge Type</td>
			<td>
				<select name="charge_type">
					<option value="Hour" <cfif #charge_type# EQ 'Hour'>checked</cfif>>Hour</option>
					<option value="Layer" <cfif #charge_type# EQ 'Layer'>checked</cfif>>Layer</option>
					<option value="Day" <cfif #charge_type# EQ 'Day'>checked</cfif>>Day</option>
					<option value="Unit" <cfif #charge_type# EQ 'Unit'>checked</cfif>>Unit</option>
					<option value="Category" <cfif #charge_type# EQ 'Category'>checked</cfif>>Category</option>
					<option value="Sheet" <cfif #charge_type# EQ 'Sheet'>checked</cfif>>Sheet</option>
				</select>			
			</td>
		</tr>
		<tr>
		  <td colspan="2" align="right"><input type="submit" class="normalButton" name="Submit" value="Submit"></td>
	  </tr>
	</table>
</form>
</cfoutput>