<cfquery name="projectInfo" datasource="centerline">
			SELECT * FROM projects WHERE id=#url.id#
		</cfquery>
		
<cfif #projectInfo.maint_lock# EQ 1 AND #url.calledByUser# NEQ 1>
	<h1>Access Denied</h1>
	<p>This project has been locked for maintenance, and can only be modified by the webmaster.</p>
	<cfabort>
</cfif>

<cfoutput>
<!--
<wwafcomponent>Project View - #projectInfo.clsJobNumber#</wwafcomponent>
<wwafsidebar>sb_ProjectView.cfm?id=#url.id#</wwafsidebar>
<wwafdefinesmap>true</wwafdefinesmap>
<wwafpackage>Workflow Manager</wwafpackage>
<wwaficon>report.png</wwaficon>
-->
</cfoutput>

<cfoutput>
<div id="pageScriptContent" style="display:none">
// <![CDATA[
	getMapByLatLng('mapTarget', #projectInfo.latitude#, #projectInfo.longitude#, '<strong>Center Line Services</strong><br>Project ###projectInfo.clsJobNumber#<br><br>#projectInfo.address#<br>#projectInfo.city#, #projectInfo.state#  #projectInfo.zip#<br><br><a href=javascript:setListView()>Return to Project View</a>');
// ]]>
</div>
</cfoutput>

		
<cfoutput>
						<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:##3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">View Project Information</h3>
						<table width="100%" cellspacing="0">
							<tr>
		  	<th align="left">Location Information</th>
			<th align="right" id="locStat" style="color:##33FF00; font-weight:lighter;">No changes made since last save.</th>
				
		    <th align="right">
				<!--function updateLocationInfo(statusDiv, project_id, address, city, 
							state, zip, subdivision, lot, block, 
							section, township, range)-->
				<a href="javascript:updateLocationInfo('locStat', #url.id#, GetValue('address'), GetValue('city'), GetValue('state'), GetValue('zip'), GetValue('latitude'), GetValue('longitude'), GetValue('subdivision'), GetValue('lot'), GetValue('block'), GetValue('section'), GetValue('township'), GetValue('range'));">
				<img src="/graphics/database_save.png" border="0"/>				</a> </th>           						  </tr>
							
							  <tr>
								<td class="int">Street Address:</td>
								<td colspan="2" class="int"><input name="address" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="address" type="text" value="#projectInfo.address#" size="50"   onkeyup="invalidateSection('locStat');" class="inputText" onblur="calcLatLng();"/></td>
							  </tr>
							   <tr>
								<td class="int">City:</td>
								<td colspan="2" class="int"><input name="city" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="city" type="text" value="#projectInfo.city#" size="50" onkeyup="invalidateSection('locStat');" class="inputText" onblur="calcLatLng();"/></td>
							  </tr>
							  <tr>
								<td class="int">State:</td>
								<td colspan="2" class="int"><input name="state" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="state" type="text" value="#projectInfo.state#" size="50" onkeyup="invalidateSection('locStat');" class="inputText" onblur="calcLatLng();"/></td>
							  </tr>
							  <tr>
								<td class="int">ZIP:</td>
								<td colspan="2" class="int"><input name="zip" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="zip" type="text" value="#projectInfo.zip#" size="50" onkeyup="invalidateSection('locStat');" class="inputText" onblur="calcLatLng();"/></td>
							  </tr>
							  <cfif #url.permissionLevel# EQ 1>
							  <tr>
							  	<td class="int">&nbsp;</td>
								<td colspan="2" class="int"><input type="button" class="normalButton" name="cc" value="Calculate Latitude/Longitude" onclick="calcLatLng();" /></td>
								</tr>
								</cfif>
							   <tr>
								<td class="int">Latitude:</td>
								<td colspan="2" class="int"><input name="latitude" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="latitude" type="text" value="#projectInfo.latitude#" size="50" onkeyup="invalidateSection('locStat');" class="inputText"/></td>
							  </tr>
							   <tr>
								<td class="int">Longitude:</td>
								<td colspan="2" class="int"><input name="longitude" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="longitude" type="text" value="#projectInfo.longitude#" size="50" onkeyup="invalidateSection('locStat');" class="inputText"/></td>
							  </tr>
							
							 
							  <tr>
								<td class="int">Subdivision:</td>
								<td colspan="2" class="int"><input name="subdivision" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="subdivision" type="text" value="#projectInfo.subdivision#" size="50" onkeyup="invalidateSection('locStat');" class="inputText"/></td>
							  </tr>
							  <tr>
								<td class="int">Lot:</td>
								<td colspan="2" class="int"><input name="lot" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="lot" type="text" value="#projectInfo.lot#" size="50" onkeyup="invalidateSection('locStat');" class="inputText"/></td>
							  </tr>
							  <tr>
								<td class="int">Block:</td>
								<td colspan="2" class="int"><input name="block" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="block" type="text" value="#projectInfo.block#" size="50" onkeyup="invalidateSection('locStat');" class="inputText"/></td>
							  </tr>
							  <tr>
								<td class="int">Section:</td>
								<td colspan="2" class="int"><input name="section" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="section" type="text" value="#projectInfo.section#" size="50" onkeyup="invalidateSection('locStat');" class="inputText"/></td>
							  </tr>
							  <tr>
								<td class="int">Township:</td>
								<td colspan="2" class="int"><input name="township" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="township" type="text" value="#projectInfo.township#" size="50" onkeyup="invalidateSection('locStat');" class="inputText"/>          </td>
							  </tr>
							  <tr>
								<td class="int">Range:</td>
								<td colspan="2" class="int"><input name="range" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="range" type="text" size="50" value="#projectInfo.range#" onkeyup="invalidateSection('locStat');" class="inputText"/></td>
							  </tr>
							  <cfif #url.permissionLevel# EQ 1>
							  <tr>
							  	<td class="int">&nbsp;</td>
								<td class="int" colspan="2"><input type="button" class="normalButton" value="Calculate Section/Township/Range" onclick="loadTRS();" /></td>
								</tr>
							   </cfif>
							 				<tr>
		  	<th align="left">Filing Information</th>
			<th align="right" id="filingStat" style="color:##33FF00; font-weight:lighter;">No changes made since last save.</th>
				
		    <th align="right">
				<!--function updateFilingInfo(statusDiv, project_id, SubdivisionOrDeed, FilingType, PlatCabinetBook,
						  PageOrSlide, PageSlide, ReceptionNumber, FilingDate, CertifiedTo)-->
				<a href="javascript:updateFilingInfo('filingStat', #url.id#, AjaxGetCheckedValue('SubdivisionOrDeed'), AjaxGetCheckedValue('FilingType'), GetValue('PlatCabinetBook'), AjaxGetCheckedValue('PageOrSlide'), GetValue('PageSlide'), GetValue('ReceptionNumber'), GetValue('FilingDate'), GetValue('CertifiedTo'));">
				<img src="/graphics/database_save.png" border="0"/>				</a> </th>           						  </tr>
							  <tr>
            <td class="int">
					<blockquote>
					<p>
						    <label>
						      <input type="radio" <cfif #url.permissionLevel# EQ 0>disabled</cfif> name="SubdivisionOrDeed" value="Subdivision" <cfif #projectInfo.SubdivisionOrDeed# EQ "Subdivision">checked</cfif> onclick="invalidateSection('filingStat');"/>
						      Subdivision</label>
						    <br />
						    <label>
						      <input type="radio" <cfif #url.permissionLevel# EQ 0>disabled</cfif> name="SubdivisionOrDeed" value="Deed" <cfif #projectInfo.SubdivisionOrDeed# EQ "Deed">checked</cfif> onclick="invalidateSection('filingStat');"/>
						      Deed</label>
						    <br />
				      </p>
					 <p>
				      <label>
				        <input type="radio" <cfif #url.permissionLevel# EQ 0>disabled</cfif> name="FilingType" value="Plat" <cfif #projectInfo.FilingType# EQ "Plat">checked</cfif> onclick="invalidateSection('filingStat');"/>
				        Plat</label>
				      <br />
				      <label>
				        <input type="radio" <cfif #url.permissionLevel# EQ 0>disabled</cfif> name="FilingType" value="Cabinet"  <cfif #projectInfo.FilingType# EQ "Cabinet">checked</cfif> onclick="invalidateSection('filingStat');"/>
				        Cabinet</label>
				      <br />
				      <label>
				        <input type="radio" <cfif #url.permissionLevel# EQ 0>disabled</cfif> name="FilingType" value="Book"  <cfif #projectInfo.FilingType# EQ "Book">checked</cfif> onclick="invalidateSection('filingStat');"/>
				        Book</label>
				      <br />
			      </p>
				  </blockquote>			  </td>
            <td colspan="2" class="int"><input type="text" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="PlatCabinetBook" name="PlatCabinetBook" value="#projectInfo.PlatCabinetBook#" onkeyup="invalidateSection('filingStat');" class="inputText"/>			</td>
          </tr>
		  <tr>
            <td class="int"> <blockquote><p><label>
						      <input type="radio" <cfif #url.permissionLevel# EQ 0>disabled</cfif> name="PageOrSlide" value="Page" <cfif #projectInfo.PageOrSlide# EQ "Page">checked</cfif> onclick="invalidateSection('filingStat');"/>
						      Page</label>
						    <br />
						    <label>
						      <input type="radio" <cfif #url.permissionLevel# EQ 0>disabled</cfif> name="PageOrSlide" value="Slide" <cfif #projectInfo.PageOrSlide# EQ "Slide">checked</cfif> onclick="invalidateSection('filingStat');"/>
						      Slide</label>
						    <br />
						    </p></blockquote></td>
            <td colspan="2" class="int"><input type="text" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="PageSlide" name="PageSlide" value="#projectInfo.PageSlide#" onkeyup="invalidateSection('filingStat');" class="inputText"/></td>
          </tr>
		  <tr>
            <td class="int">Reception or Document Number:</td>
            <td colspan="2" class="int"><input type="text" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="ReceptionNumber" name="ReceptionNumber" size="50" value="#projectInfo.ReceptionNumber#" onkeyup="invalidateSection('filingStat');" class="inputText"/></td>
          </tr>
		 
		  <tr>
            <td class="int">Filing Date:</td>
            <td colspan="2" class="int"><input type="text" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="FilingDate" name="FilingDate" size="50" value="#DateFormat(projectInfo.FilingDate, 'mm/dd/yyyy')#"  onkeyup="invalidateSection('filingStat');" class="inputText"/> <cfif #url.permissionLevel# EQ 1><a href="javascript:popupDate(AjaxGetElementReference('FilingDate'));"><img src="graphics/date.png" border="0" /></a></cfif></td>
          </tr>
		   <tr>
            <td class="int">Certified To:</td>
            <td colspan="2" class="int"><input type="text" <cfif #url.permissionLevel# EQ 0>readonly</cfif> id="CertifiedTo" name="CertifiedTo" size="50" value="#projectInfo.CertifiedTo#" onkeyup="invalidateSection('filingStat');" class="inputText"/></td>
          </tr>
		  
		  <tr>
		  	<th align="left">Other Project Information</th>
			<th align="right" id="otherStat" style="color:##33FF00; font-weight:lighter;">No changes made since last save.</th>
				
		    <th align="right">
				
				<a href="javascript:updateOtherInfo('otherStat', #url.id#, GetValue('specialinstructions'));">
				<img src="/graphics/database_save.png" border="0"/>				</a> </th>           						  </tr>
		   <tr>
            <td class="int">Special Instructions:</td>
            <td colspan="2" class="int"><textarea name="specialinstructions" cols="50" rows="8" class="inputText" id="specialinstructions" onkeyup="invalidateSection('otherStat');">#projectInfo.specialinstructions#</textarea></td>
          </tr>
						</table>
						</cfoutput>