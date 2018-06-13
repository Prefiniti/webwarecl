<link href="centerline.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/framework/framework.js"></script>


<div class="sidebarBlock"  style="height:300px">
<span style="background-color:#EFEFEF; display:block; padding:5px; -moz-border-radius-topleft:10px;">

			<span id="packageIcon" style="padding-left:10px;"></span><span id="packageName" style="padding-left:3px; padding-right:3px;"></span>
</span>
<div id="sbTarget">

</div>
</div>


<div id="tabBars" class="tabBar">
	<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();"><span id="documentName">List View</span></a></span>
	
</div>
				
<div id="stWrapper" class="orderListBlock" style="padding:0px;">
	<div id="stT">
		
			
			<div style="width:100%; background-color:#EFEFEF;">
			<cfif #session.loggedin# EQ "yes">
			<a href="javascript:loadHomeView();"><img src="graphics/application_home.png" border="0" align="absmiddle" /></a>
			</cfif>
			<a href="javascript:AjaxRefreshTarget();"><img src="graphics/page_refresh.png" border="0" align="absmiddle" /></a>
			<select id="history" name="history" size="1" onchange="AjaxLoadPageToDiv('tcTarget', GetValue('history'));"><option value=""> </option></select><a href="javascript:AjaxLoadPageToDiv('tcTarget', GetValue('history'));"><img src="graphics/page_go.png" border="0" align="absmiddle"/></a> | <img src="graphics/help.png" align="absmiddle" /> <a href="javascript:loadLiveHelp();">Live Help</a>
			</div>
		
	</div>
	
	<div id="tcTarget" style="padding:0px;">
	
	</div>

</div>


<cfoutput>
	<script language="javascript">
		loadSidebar('#URL.sideBar#');
		loadContentBar('#URL.contentBar#');
	</script>
</cfoutput>