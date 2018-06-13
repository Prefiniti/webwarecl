<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>My CL</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="sidebarBlock" id="sbTarget" style="height:auto">

</div>

<div id="tabBars" class="tabBar">
	<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();"><span id="documentName">List View</span></a></span>
	<span class="tabButtonInactive" id="mapViewBtn"><a href="javascript:setMapView();"><span id="mapViewText">Map View</span></a></span>
</div>
				
<div id="tcTargetW" class="orderListBlock" style="padding:0px;">
	<div id="tcTargetToolbar">
		<cfif #session.loggedin# EQ "yes">
			<div style="width:100%; background-color:#CCCCCC;">
			<a href="javascript:loadHomeView();"><img src="graphics/application_home.png" border="0" align="absmiddle" /></a>
			<a href="javascript:AjaxRefreshTarget();"><img src="graphics/page_refresh.png" border="0" align="absmiddle" /></a>
			<select id="history" name="history" size="1" onchange="AjaxLoadPageToDiv('tcTarget', GetValue('history'));"><option value=""> </option></select><a href="javascript:AjaxLoadPageToDiv('tcTarget', GetValue('history'));"><img src="graphics/page_go.png" border="0" align="absmiddle"/><span id="packageIcon" style="padding-left:10px;"></span><span id="packageName"></span></a>
			</div>
		</cfif>
	</div>
	
	<div id="tcTarget" style="padding:0px;">
	
	</div>

</div>

<div id="mapTarget" class="orderListBlock" style="display:none" align="center">
	<p class="VPLink">No map view defined for this page.</p>				
</div>

<script language="javascript">
	loadHomeView();
</script>

</body>
</html>
