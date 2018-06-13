<div class="sidebarBlock" id="sbTarget" style="height:auto">

</div>

<div id="tabBars" class="tabBar">
	<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();"><span id="documentName">List View</span></a></span>
	<span class="tabButtonInactive" id="mapViewBtn"><a href="javascript:setMapView();"><span id="mapViewText">Map View</span></a></span>
</div>
				
<div id="stWrapper" class="orderListBlock" style="padding:0px;">
	<div id="stT">
		<cfif #session.loggedin# EQ "yes">
			
			<div style="width:100%; background-color:#CCCCCC;">
			
			<a href="javascript:loadHomeView();"><img src="graphics/application_home.png" border="0" align="absmiddle" /></a>
			<a href="javascript:AjaxRefreshTarget();"><img src="graphics/page_refresh.png" border="0" align="absmiddle" /></a>
			<select id="history" name="history" size="1" onchange="AjaxLoadPageToDiv('tcTarget', GetValue('history'));"><option value=""> </option></select><a href="javascript:AjaxLoadPageToDiv('tcTarget', GetValue('history'));"><img src="graphics/page_go.png" border="0" align="absmiddle"/></a>
			</div>
		</cfif>
	</div>
	
	<div id="tcTarget" style="padding:0px;">
	
	</div>

</div>

<div id="mapTarget" class="orderListBlock" style="display:none" align="center">
	<p class="VPLink">No map view defined for this page.</p>				
</div>
<cfoutput>
<script language="javascript">
	loadProjectViewer(#url.id#);
</script>
</cfoutput>