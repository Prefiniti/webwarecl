<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<cfapplication name="CenterlineServices" sessionmanagement="yes">
<cfparam name="session.username" default="">
<cfparam name="session.userid" default="">
<cfparam name="session.usertype" default="0">
<cfparam name="session.longname" default="0">
<cfparam name="session.loggedin" default="no">
<cfparam name="session.message" default="">
<cfparam name="session.datasource" default="centerline">
<cfparam name="session.jobreceiver" default="">
<cfparam name="session.maintenance" default="0">
<cfparam name="session.logins_disabled" default="0">
<cfparam name="session.site_maintainer" default="0">
<cfparam name="session.role" default="">
<cfparam name="session.order_processor" default="0">
<cfparam name="session.email" default="">
<cfparam name="session.unread" default="0">
<cfparam name="session.overdue" default="0">
<cfparam name="session.urlparm" default="">
<cfparam name="session.tcadmin" default="no">
<cfparam name="session.tcsigned" default="0">
<cfparam name="session.tcopen" default="0">
<cfparam name="session.newJobs" default="0">
<cfparam name="session.itemAttention" default="true">
<cfparam name="session.browserType" default="">
<cfparam name="session.companyID" default="">
<cfparam name="session.pwdiff" default="">
<cfparam name="session.last_loaded_page" default="">
<cfparam name="session.remember_page" default="">

<!---
<cferror type="exception" template="error.cfm" mailto="johnwillis@centerlineservices.biz">
--->

<head>
<div></div>
<div style="display:none;">
<input type="text" name="n" id="n" />
</div>
<style type="text/css">

#dropmenudiv{
position:absolute;
border:1px solid silver;
-moz-opacity:.80;
border-bottom-width: 1;
	font-family: "Lucida Grande", Tahoma, Verdana, Arial, Helvetica, sans-serif;
	font-size: small;
	font-weight:lighter;
	color:#EFEFEF;
line-height:18px;
z-index:100;
padding:0px;
background-color:#EFEFEF;

}

#dropmenudiv a{
background-color:#EFEFEF;
width: 100%;
display:block;
vertical-align:middle;
text-indent: 3px;
clear:right;
padding-left:10px;
padding-right:3px;
padding-bottom:0px;
padding-top:4px;
text-decoration: none;
font-weight: lighter;
}

#dropmenudiv img {
	<cfif #session.browserType# NEQ "Microsoft Internet Explorer">
		display:block;
	<cfelse>
		display:none;
	</cfif>
	float:left;
	
	padding:3px 0;
	padding-top:3px;
	border-right:1px solid black;
	background-color:#C0C0C0;
	vertical-align:middle;
}

#dropmenudiv 
{ /*hover background color*/
background-color:#CCCCCC;
}

</style>



<script type="text/javascript" src="/Components/AJAX/ajax.js"></script>
<script type="text/javascript" src="tc/timecard.js"></script>
<script type="text/javascript" src="calendar2.js"></script>
<script type="text/javascript" src="workFlow/components/projectStatus.js"></script>
<script type="text/javascript" src="workFlow/projects.js"></script>
<script type="text/javascript" src="MyCL/components/collapse.js"></script>
<script type="text/javascript" src="framework/framework.js"></script>
<script type="text/javascript" src="formValidate.js"></script>
<script type="text/javascript" src="contentManager/contentManager.js"></script>
<!---<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAANDvmFaqAegt0QYIzYW9D3BQVVoJkOkF3saee8Le5EpBd0ZFOdxQMOC6BBSwv7nLW2mvQq6S6JYuO6Q"
      type="text/javascript"></script>
<script type="text/javascript" src="mapping/mapping.js"></script>--->
<script type="text/javascript" src="legalSection/legalsection.js"></script>
<script type="text/javascript" src="news/news.js"></script>
<script type="text/javascript" src="authentication/authentication.js"></script>
<script type="text/javascript" src="globals.js"></script>
<script type="text/javascript" src="mail/mail.js"></script>
<script type="text/javascript" src="scheduling/scheduling.js"></script>
<script type="text/javascript" src="notification/notification.js"></script>
<script type="text/javascript" src="orderWizard/orderwizard.js"></script>
<script type="text/javascript" src="help/help.js"></script>
<script type="text/javascript" src="soundmanager.js"></script>
<script type="text/javascript" src="netsearch/netsearch.js"></script>
<script type="text/javascript" src="chat/chat.js"></script>
<script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<LINK REL="SHORTCUT ICON" href="http://webwarecl.prefiniti.com/graphics/mycl.ico">
<link rel="alternate" type="application/rss+xml" title="Center Line Services RSS" href="http://webwarecl.prefiniti.com/news/rss.cfm">
<cfif #session.browserType# NEQ "Microsoft Internet Explorer">
	<link href="centerline.css" rel="stylesheet" type="text/css" />
<cfelse>
	<link href="centerline-msie.css" rel="stylesheet" type="text/css" />
</cfif>
</head>

<body onresize="handleAppResize();" onunload="handleAppUnload();">
<cfquery name="getConfig" datasource="#session.datasource#">
SELECT * FROM config
</cfquery>
<cfset session.jobreceiver="#getConfig.jobapprover#">
<cfif NOT IsDefined("url.supressApplication")>

<cfif FindNoCase("MSIE", cgi.HTTP_USER_AGENT) NEQ 0>
	<cfset session.browserType="Microsoft Internet Explorer">
<cfelseif FindNoCase("Firefox", cgi.HTTP_USER_AGENT) NEQ 0>
	<cfset session.browserType="Mozilla Firefox">
<cfelse>
	<cfset session.browserType="an unknown browser">
</cfif>

<div style="position:absolute; left:0; top:0; width:100%; height:100%; background-color:#CCCCCC; -moz-opacity:.60; display:none; z-index:150;" id="scrFade"></div>

<div id="headBar"><table width="100%" cellspacing="0"><tr><th align="left"><a href="##"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, appMenu, '150px')" onmouseout="delayhidemenu()"><img src="graphics/application_go.png" border="0" align="absmiddle"/></a> WebWare.CL - Center Line Services</th><th align="right"><a href="javascript:closeWebware();"><img src="graphics/delete.png" border="0" align="absmiddle" /></a></th></tr></table></div>
<cfoutput>

<cfif #session.loggedin# EQ "yes">
    <cfif session.userid EQ "">
        <cfset session.loggedin = false>
        <cfabort>
    </cfif>

<table width="100%" class="menuTable">
<tr>
<td align="left" class="menuTable" valign="middle" ><cfswitch expression="#session.usertype#">
            <cfcase value="0">
            <!---Customer Nav Links --->
            <div class="navBtn">
            	<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, custOrdersMenu, '150px')" onmouseout="delayhidemenu()">Orders</a>			</div>
                <div class="navBtn">
            	<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, custAcctMenu, '150px')" onmouseout="delayhidemenu()">Account</a>			</div>
                <div class="navBtn">
            	<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, mailMenu, '150px')" onmouseout="delayhidemenu()">Mail</a>			</div>
            <!---<img src="graphics/application_home.png" align="absmiddle" /> <a href="javascript:loadHomeView();" >Customer Home</a> <img src="graphics/cart_add.png" align="absmiddle" /> <a href="javascript:AjaxLoadPageToDiv('tcTarget', '/workflow/components/surveyorderform.cfm');" >Request Services</a> <img src="graphics/lock_edit.png" align="absmiddle" /> <a href="javascript:editUser(#session.userid#);" >Edit Profile</a> <img src="graphics/door_out.png" align="absmiddle"/> <a href="javascript:viewMailFolder('inbox');">Inbox</a> <a href="javascript:writeMessage();">Write Message</a> <a href="logoff.cfm" >Log Out</a>--->
            </cfcase>
            <cfcase value="1">
            <!---Employee Nav Links --->
			<div class="navBtn">
            	<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, ordersMenu, '150px')" onmouseout="delayhidemenu()">Orders</a>			</div>
			<div class="navBtn">
				<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, projectsMenu, '150px')" onmouseout="delayhidemenu()">Projects</a>			</div>
            <div class="navBtn">
				<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, gisMenu, '150px')" onmouseout="delayhidemenu()">GIS</a>			</div>    
			<div class="navBtn">
				<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, schedulingMenu, '150px')" onmouseout="delayhidemenu()">Scheduling</a>			</div>
			<div class="navBtn">
				<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, timeMenu, '150px')" onmouseout="delayhidemenu()">Time Entry</a>			</div>
			<div class="navBtn">
				<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, accountsMenu, '150px')" onmouseout="delayhidemenu()">Accounts</a>			</div>
			<div class="navBtn">
				<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, reportsMenu, '150px')" onmouseout="delayhidemenu()">Reports</a>			</div>
			<div class="navBtn">
				<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, mailMenu, '150px')" onmouseout="delayhidemenu()">Mail</a>			</div>
			<div class="navBtn">
				<a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, toolsMenu, '150px')" onmouseout="delayhidemenu()">Tools</a>			</div>

			
            </cfcase>
          </cfswitch>        </td>
	</tr>
</table>
</cfif>
</cfoutput>


	
	

<div class="bodyWrapper" id="mastHead" style="display:inline; margin-top:30px;">

<table width="100%" align="left" cellspacing="0" cellpadding="0"  style="margin-left:0px; margin-top:10px; clear:both;">
  <tr>
    <td rowspan="2" valign="middle">
		<cfif #session.loggedin# EQ "yes">
			<img src="graphics/mycl.gif" />
		<cfelse>
			<img src="graphics/cls.gif" width="350" style="margin-top:30px;"/> 
		</cfif>
	</td>
    <td valign="middle" align="right">&nbsp;
		<img src="graphics/service.gif" />
	</td>
  </tr>
  <tr>
    <td valign="bottom">
		<div class="topLinks">
			<table width="100%">
			  
			  <tr align="right">
				<td class="topLinks"><img src="graphics/application_home.png" align="absmiddle" />
				<cfif #session.loggedin# EQ "yes">
					<cfswitch expression="#session.usertype#">
						<cfcase value="0">
							<a href="customer-home.cfm" class="navLinks">MyCL Home</a>	
						</cfcase>
						<cfcase value="1">
							<a href="mycl-emp.cfm" class="navLinks">MyCL Home</a>
						</cfcase>
					</cfswitch>
				<cfelse>
					<a href="default.cfm" class="navLinks">Home</a></td>
				</cfif>
				<!--- <td><a href="construction.cfm" class="navLinks">Clients</a></td> --->
				<td class="topLinks"><img src="graphics/group.png" align="absmiddle" /> <a href="http://webwarecl.prefiniti.com/appBase.cfm?sidebar=Staff&contentBar=/staff/staff_base.html" class="navLinks">Staff</a></td>
				<td class="topLinks"><img src="graphics/page.png" align="absmiddle" /> <a href="services.cfm" class="navLinks">Services</a></td>
				<td class="topLinks"><img src="graphics/wrench.png" align="absmiddle" /> <a href="projectMap.cfm" class="navLinks">Projects</a></td>
				<!--- <td><a href="construction.cfm" class="navLinks">Pictures</a></td> --->
				<!---<cfif #session.loggedin# EQ "no">
				  <td class="topLinks"><img src="graphics/lock_open.png" align="absmiddle" /> <a href="login.cfm" class="navLinks">Log In</a></td>
				</cfif>--->
				<td class="topLinks"><img src="graphics/email.png" align="absmiddle" /> <a href="contact.cfm" class="navLinks">Contact Us</a></td>
			  </tr>
			</table>
		</div>
	</td>
  </tr>
</table>

<cfquery name="siteStatus" datasource="#session.datasource#">
	SELECT * FROM config
</cfquery>
	
<cfset session.maintenance=#siteStatus.maintenance#>
<cfset session.logins_disabled=#siteStatus.logins_disabled#>

<cfif #session.logins_disabled# EQ 1>
	<cfif #session.site_maintainer# NEQ 1>
		<cfif #session.loggedin# EQ "yes">
		<cfset session.loggedin="no">
		<cfset session.message='Our site is currently undergoing maintenance. Please try again later.'>
		
		
		</cfif>
	</cfif>
</cfif>



<cfif #session.loggedin# EQ "yes">
  <p>
    <cfquery name="unreadQ" datasource="#session.datasource#">
    SELECT * FROM messageInbox WHERE touser=#session.userid# AND tread='no'
    </cfquery>
    <cfset session.unread=#unreadQ.recordcount#>
    <cfquery name="odc" datasource="#session.datasource#">
    SELECT clsJobNumber FROM projects WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) > duedate AND SubStatus <> 'Closed'
    </cfquery>
    <cfset session.overdue=#odc.recordcount#>
    <cfquery name="tcs" datasource="#session.datasource#">
    SELECT id FROM time_card WHERE closed=1
    </cfquery>
    <cfset session.tcsigned=#tcs.recordcount#>
    <cfquery name="tco" datasource="#session.datasource#">
    SELECT id FROM time_card WHERE emp_id=#session.userid# AND closed=0
    </cfquery>
    <cfset session.tcopen=#tco.recordcount#>
    <cfquery name="newJobs" datasource="#session.datasource#">
    SELECT viewed FROM projects WHERE viewed=0 AND stage=0
    </cfquery>
	<cfquery name="mhV" datasource="#session.datasource#">
		SELECT masthead_closed FROM users WHERE id=#session.userid#
	</cfquery>
    <cfquery name="gllp" datasource="#session.datasource#">
    	SELECT last_loaded_page FROM users WHERE id=#session.userid#
    </cfquery>

	<cfquery name="grp" datasource="#session.datasource#">
    	SELECT remember_page FROM users WHERE id=#session.userid#   
    </cfquery>
    
    <cfset session.remember_page=#grp.remember_page#>
    <cfset session.last_loaded_page=#gllp.last_loaded_page#>
	
	
    <cfset session.newJobs=#newJobs.recordcount#>
	
	<cfoutput>
		<script language="javascript">
			glob_userid='#session.userid#';
			glob_companyid='#session.companyID#';
			<cfif #session.role# EQ "ADMIN">
				glob_isAdmin = true;
			<cfelse>
				glob_isAdmin = false;
			</cfif>
			
			hideDiv('mastHead');
			glob_usertype = #session.usertype#;
			glob_isTCAdmin = '#session.tcadmin#';
			glob_unreadMail = '#unreadQ.RecordCount#';
			glob_order_processor = '#session.order_processor#';
			glob_site_maintainer = '#session.site_maintainer#';
			glob_userName = '#session.userName#';
			glob_longName = '#session.longname#';
			glob_tcsigned = '#session.tcsigned#';
			glob_tcopen = '#session.tcopen#';
			glob_overdue = '#session.overdue#';
			glob_newJobs = '#session.newJobs#';
			soundManagerInit();
			<cfif #session.browsertype# NEQ "Microsoft Internet Explorer">
				//enableRTEventListener();
			<cfelse>
				showMessage('Browser Warning', 'You are running Internet Explorer.<br>Event notifications disabled.');
			</cfif>
		</script>
	</cfoutput>	
	
	
	
  </p>
 
 

</cfif>
<!---<cfif #session.browserType# EQ "Microsoft Internet Explorer">
		<p style="clear:both; border:1px solid red; padding:3px;"><strong>Browser Warning:</strong> We have detected that you are running Microsoft Internet Explorer. This site has been optimized for <a style="color:blue;" href="http://www.mozilla.com/en-US/firefox/">Mozilla Firefox</a> or <a style="color:blue;" href="http://browser.netscape.com/downloads/">Netscape Navigator 8 (or higher)</a>. Please download for a better MyCL WebWare experience.</p>
	</cfif>--->
	
	<cfif #session.maintenance# EQ 1>
		<p style="clear:both; border:1px solid red; padding:3px;"><strong>Maintenance Warning:</strong> Our site is currently undergoing maintenance and/or development. Although we have not disabled your ability to sign in, some features may be unavailable, or may exhibit unusual and/or erratic behavior at this time.<br /><br /> We apologize for any inconvenience this may cause.</p>
	</cfif>
</div>
<script type="text/javascript" src="menus/menus.js"></script>
<cfif #session.message# NEQ "">
	
	<div class="sessionMessage" id="sMsg">
		<table width="100%" border="0" cellspacing="0">
			<tr><th align="left">MyCL Message</th><th align="right"><a href="javascript:hideDiv('sMsg');"><img src="graphics/delete.png" border="0"></a></tr>
		</table>
		
		<br>
		<img src="graphics/exclamation.png" align="absmiddle"> <cfoutput>#session.message#</cfoutput><br /><br />
		<input type="button" class="normalButton" value="Close Message" onclick="javascript:hideDiv('sMsg');" /><br />
	</div>
	<cfset session.message="">				
</cfif>
	<div class="genMessage" id="gMsg" style="display:none; height:auto;">
		<table width="100%" border="0" cellspacing="0">
			<tr><th align="left" id="gMsgTitle">MyCL Message</th><th align="right"><a href="javascript:hideDiv('sMsg');"><img src="graphics/delete.png" border="0"></a></tr>
		</table>
		
		<br>
		<img src="graphics/exclamation.png" align="absmiddle" border="0"> <span id="gMsgText">&nbsp;</span><br /><br />
		<input type="button" class="normalButton" value="Close Message" onclick="javascript:hideDiv('gMsg'); hideDiv('scrFade');" /><br />
	</div>
	<cfinclude template="/help/components/helpWrapper.cfm">
	<cfinclude template="/mapping/mapWrapper.cfm">
	<cfinclude template="/contentManager/components/fileBrowserWrapper.cfm">
	<br />
<div class="bodyWrapper" id="appArea" style="height:650px; width:100%; overflow:auto;  padding:0px; margin:0px; background-image:url(); background-repeat:repeat; ">

</cfif>
