<cfquery name="p" datasource="centerline">
	SELECT address, city, state, zip, clsJobNumber, id FROM projects 
	WHERE 	address != ""
	AND		city != ""
	AND		state != ""
	AND		zip != ""
	AND		Status=0
</cfquery>

<cfparam name="addressString" default="">



<div class="sidebarBlock" id="sbTarget">
	<div id="mapInfo" class="OptionsBox">
		No project selected
	</div>
</div>
<div id="tabBars" class="tabBar">
						<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();">Our Current Projects</a></span>
						
					</div>
<div class="orderListBlock" id="tcTarget">

</div>

<script language="javascript">
	<cfoutput>
		getMapNoMsg('tcTarget');
	</cfoutput>
	<cfoutput query="p">
		<cfset addressString="#address#,#city#,#state#,#zip#">
		addAddress('#addressString#', '<strong>Center Line Services</strong><br>Project ###clsJobNumber#<br><br>#address#<br>#city#, #state#  #zip#', '#id#');
	</cfoutput>
</script>
