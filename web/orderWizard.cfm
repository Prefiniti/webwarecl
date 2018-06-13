<link href="centerline.css" rel="stylesheet" type="text/css">

<div id="sbTarget" class="sidebarBlock" style="height:auto;">
	<table width="100%">
		<tr>
			<th colspan="2">Steps</th>
		</tr>
		<tr>
			<td><img src="graphics/accept.png"></td>
			<td>Ordering Introduction</td>
		</tr>
	</table>
	<div id="sStep" <cfif #url.step# EQ 1>style="display:none;"</cfif>>
	<cfoutput>
	<table width="100%">
		<tr>
			<td id="ows_2"><img src="graphics/page_edit.png"></td>
			<td><a href="javascript:loadOWStep(#url.id#, 2);">Project Name</a></td>
		</tr>
		<tr>
			<td id="ows_3"><img src="graphics/page_edit.png"></td>
			<td><a href="javascript:loadOWStep(#url.id#, 3);">Project Type</a></td>
		</tr>
		<tr>
			<td id="ows_4"><img src="graphics/page_edit.png"></td>
			<td><a href="javascript:loadOWStep(#url.id#, 4);">Physical Project Location</a></td>
		</tr>
		<tr>
			<td id="ows_5"><img src="graphics/page_edit.png"></td>
			<td><a href="javascript:loadOWStep(#url.id#, 5);">Legal Description</a></td>
		</tr>
		<tr>
			<td id="ows_6"><img src="graphics/page_edit.png"></td>
			<td><a href="javascript:loadOWStep(#url.id#, 6);">Filing Information</a></td>
		</tr>	
		<tr>
			<td id="ows_7"><img src="graphics/page_edit.png"></td>
			<td><a href="javascript:loadOWStep(#url.id#, 7);">Other Information</a></td>
		</tr>			
		<tr>
			<td id="ows_8"><img src="graphics/page_edit.png"></td>
			<td><a href="javascript:loadOWStep(#url.id#, 8);">Project Review/Upload</a></td>
		</tr>		
	</table>
	</cfoutput>
	</div>
</div>

<div id="tabBar" class="tabBar">
	<span class="tabButtonActive">Order Wizard</span>
</div>

<div id="tcTarget" class="orderListBlock">
  <p><b><span
style='font-size:14.0pt;font-family:Tahoma'>Online Ordering</span></b></p>
  <p><span class=GramE><span style='font-family:Tahoma'>Featuring
    our live help application: <span class=SpellE><i>Help.CL</i></span>.</span></span><span style='font-family:Tahoma'>&nbsp; By default <span class=SpellE><i>Help.CL</i></span> is turned on.&nbsp; If you choose to turn off <span class=SpellE><i>Help.CL</i></span> it will remain off.&nbsp; You can choose to turn it on at any time in
      your profile settings.</span></p>
  <p><span style='font-family:Tahoma'>What you need to place
    orders, request a bid or save a draft:</span></p>
  <ul type=disc>
    <li><span
     style='font-family:Tahoma'>Property information, such as: a warranty deed,
      quitclaim deed, &ldquo;Schedule B&rdquo; (furnished by a title insurance policy prior
      to a real estate transaction), county assessor's tax information on your
      property, county GIS information, Street address, Public Land Survey
      System (PLSS) information, or a legal description, etc.. All these will be
      later explained in our comprehensive online help.</span></li>
    <li><span
     style='font-family:Tahoma'>A due date for your project to be completed.</span></li>
    <li><span
     style='font-family:Tahoma'>Depending on your order you may be required to
      place a down payment.</span></li>
  </ul>
  <p><span style='font-family:Tahoma'>Thank you again for using
    our online ordering system.&nbsp; We hope you
    have a wonderful experience.</span></p>
	
	<cfoutput>
	<form name="createOrder" action="createOrder.cfm" method="post">
		<input type="hidden" name="confirm_id" value="#CreateUUID()#">
		<center>
			<input type="submit" name="submit" value="Begin Ordering Process" class="normalButton">
		</center>
	</form>
	</cfoutput>
</div>

<cfif #url.step# EQ 2>
<cfoutput>
	<script language="javascript">
		loadOWStep(#url.id#, 2);
	</script>
</cfoutput>
</cfif>
	