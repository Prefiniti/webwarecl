
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>My CL</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>


<div class="sidebarBlock"  style="height:auto; width:240px;" id="sbWrapper">
<span style="background-color:#EFEFEF; display:block; padding:5px; -moz-border-radius-topleft:10px;">

			<span id="packageIcon" style="padding-left:10px;"></span><span id="packageName" style="padding-left:3px; padding-right:3px;"></span>
</span>
<div id="sbTarget">

</div>
</div>


<div id="tabBars" class="tabBar">
	<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();"><span id="documentName">List View</span></a></span>
	<span class="tabButtonInactive" id="mapViewBtn"><a href="javascript:setMapView();"><span id="mapViewText">Map View</span></a></span>
</div>
				
<div id="stWrapper" class="orderListBlock" style="padding:0px; width:700px;">
	<div id="stT">
		<cfif #session.loggedin# EQ "yes">
			
			<div style="width:100%; background-color:#EFEFEF;">
			
			<a href="javascript:loadHomeView();"><img src="graphics/application_home.png" border="0" align="absmiddle" /></a>
			<a href="javascript:AjaxRefreshTarget();"><img src="graphics/page_refresh.png" border="0" align="absmiddle" /></a>
			<select id="history" name="history" size="1" onchange="AjaxLoadPageToDiv('tcTarget', GetValue('history'));"><option value=""> </option></select><!---<a href="javascript:AjaxLoadPageToDiv('tcTarget', GetValue('history'));"><img src="graphics/page_go.png" border="0" align="absmiddle"/></a> | ---><img src="graphics/help.png" align="absmiddle" /> <a href="javascript:AjaxLoadPageToDiv('tcTarget', '/chat/liveHelpIntro.cfm');">Live Help</a> 
			</div>
		</cfif>
	</div>
	
	<div id="tcTarget" style="padding:0px;">
	
	</div>

</div>

<div id="mapTarget" class="orderListBlock" style="display:none; padding:0px;" align="center">
	<p class="VPLink">No map view defined for this page.</p>				
</div>

<cfoutput>
<cfif #session.pwdiff# GE 30>
	<script language="javascript">
		AjaxLoadPageToDiv('tcTarget', '/authentication/components/changePassword.cfm?id=#session.userid#&expired=true');
	</script>
<cfelse>
	<cfif #session.last_loaded_page# EQ "">
		<script language="javascript">
			loadHomeView();
		</script>
    <cfelse>
    	<cfif #session.remember_page# EQ 1>
			<script language="javascript">
                AjaxLoadPageToDiv('tcTarget', '#session.last_loaded_page#');
            </script>
        <cfelse>
			<script language="javascript">
                loadHomeView();
            </script>                
        </cfif>
    </cfif>
    
    <script language="javascript">
		handleAppResize();
	</script>
</cfif>
</cfoutput>
</body>
</html>
