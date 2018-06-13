<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px; margin-bottom:0px; padding-botton:2px;">Project Type</h3>

<div style="padding-left:30px;">
	<p>
	<label>
	<input type="radio" name="JobType" value="Improvement Survey - Meets & Bounds" />
	Improvement Survey - Meets & Bounds</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Improvement Survey - Lot & Block" />
	Improvement Survey - Lot & Block</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="ALTA/ACSM" />
	ALTA/ACSM</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Construction Layout" />
	Construction Layout</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Claim of Exemption" />
	Claim of Exemption</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Plat of Survey" />
	Plat of Survey</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Legal Description" />
	Legal Description</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Survey Inspection Report" />
	Survey Inspection Report</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Flood Certification" />
	Flood Certification</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Topographic Survey" />
	Topographic Survey</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Aerial Mapping" />
	Aerial Mapping</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Subdivision" />
	Subdivision</label>
	<br />
	<label>
	<input type="radio" name="JobType" value="Other" />
	Other</label>
	<br />
	</p>
	
	<label>Project needs to be completed by: <input type="text" name="duedate" id="duedate" readonly/></label> <a href="javascript:popupDate(AjaxGetElementReference('duedate'));"><img src="/graphics/date.png" border="0" /></a> (click the calendar icon to choose a date)
</div>

<hr />
<cfoutput>
<table width="100%">
	<tr>
		<td align="right">
			<input type="button" name="back" class="normalButton" value="Back" onclick="loadOWStep(#url.id#, #url.back#);">
			<input type="button" name="next" class="normalButton" value="Next" onclick="writeStep(#url.id#, #url.step#);">
		</td>
	</tr>
</table>
</cfoutput>