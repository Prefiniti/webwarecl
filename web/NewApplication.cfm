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
<cfparam name="session.role" default="">
<cfparam name="session.email" default="">
<cfparam name="session.unread" default="0">
<cfparam name="session.overdue" default="0">
<cfparam name="session.urlparm" default="">
<cfparam name="session.tcadmin" default="no">
<cfparam name="session.tcsigned" default="0">
<cfparam name="session.tcopen" default="0">
<cfparam name="session.newJobs" default="0">
<head>
<style type="text/css">

#dropmenudiv{
position:absolute;
border:1px solid black;
border-bottom-width: 0;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
	font-weight:lighter;
	color:#0000FF;
line-height:18px;
z-index:100;
}

#dropmenudiv a{
width: 100%;
display: block;
text-indent: 3px;
border-bottom: 1px solid black;
padding: 1px 0;
text-decoration: none;
font-weight: bold;
}

#dropmenudiv a:hover{ /*hover background color*/
background-color:#CCCCCC;
}

</style>
<script type="text/javascript" src="/Components/AJAX/ajax.js"></script>
<script type="text/javascript" src="tc/timecard.js"></script>
<script type="text/javascript" src="calendar2.js"></script>
<script type="text/javascript">

/***********************************************
* AnyLink Drop Down Menu- © Dynamic Drive (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

//Contents for menu 1 (CUSTOMER TOOLS)
var accountTools=new Array()
accountTools[0]='<a href="resetPassword.cfm">Change My Password</a>'
accountTools[1]='<a href="manageCustomers.cfm#addNew">Add New Account</a>'
accountTools[2]='<a href="manageCustomers.cfm#manageExisting">Edit Accounts</a>'
accountTools[3]='<a href="manageCompanies.cfm">Manage Companies</a>'

//Contents for menu 2, (JOB TOOLS)
var jobTools=new Array()
jobTools[0]='<a href="mycl-emp.cfm">MyCL Home</a>'
jobTools[1]='<a href="jobRequest.cfm">Request New Job</a>'
jobTools[2]='<a href="checkOverdue.cfm">Send Overdue Reminders</a>'
jobTools[3]='<a href="search.cfm">Search Jobs</a>'
jobTools[4]='<a href="timeEntry.cfm?action=view">Time Entry</a>'
jobTools[5]='<a href="http://yuna.clogic-int.com/SoftwareProjects/AddProjectItem.cfm?id=9">Report Bug</a>'

var custTools=new Array()
custTools[0]='<a href="forms/custRept.cfm" target="_blank">Customer Report</a>'
custTools[1]='<a href="compose.cfm">Write a Message</a>'
custTools[2]='<a href="inbox.cfm?mailbox=inbox">MyCL Mail</a>'


		
var menuwidth='185px' //default menu width
var menubgcolor='white'  //menu bgcolor
var disappeardelay=250  //menu disappear speed onMouseout (in miliseconds)
var hidemenu_onclick="yes" //hide menu when user clicks within menu?

/////No further editting needed

var ie4=document.all
var ns6=document.getElementById&&!document.all

if (ie4||ns6)
document.write('<div id="dropmenudiv" style="visibility:hidden;width:'+menuwidth+';background-color:'+menubgcolor+'" onMouseover="clearhidemenu()" onMouseout="dynamichide(event)"></div>')

function getposOffset(what, offsettype){
var totaloffset=(offsettype=="left")? what.offsetLeft : what.offsetTop;
var parentEl=what.offsetParent;
while (parentEl!=null){
totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
parentEl=parentEl.offsetParent;
}
return totaloffset;
}


function showhide(obj, e, visible, hidden, menuwidth){
if (ie4||ns6)
dropmenuobj.style.left=dropmenuobj.style.top="-500px"
if (menuwidth!=""){
dropmenuobj.widthobj=dropmenuobj.style
dropmenuobj.widthobj.width=menuwidth
}
if (e.type=="click" && obj.visibility==hidden || e.type=="mouseover")
obj.visibility=visible
else if (e.type=="click")
obj.visibility=hidden
}

function iecompattest(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function clearbrowseredge(obj, whichedge){
var edgeoffset=0
if (whichedge=="rightedge"){
var windowedge=ie4 && !window.opera? iecompattest().scrollLeft+iecompattest().clientWidth-15 : window.pageXOffset+window.innerWidth-15
dropmenuobj.contentmeasure=dropmenuobj.offsetWidth
if (windowedge-dropmenuobj.x < dropmenuobj.contentmeasure)
edgeoffset=dropmenuobj.contentmeasure-obj.offsetWidth
}
else{
var topedge=ie4 && !window.opera? iecompattest().scrollTop : window.pageYOffset
var windowedge=ie4 && !window.opera? iecompattest().scrollTop+iecompattest().clientHeight-15 : window.pageYOffset+window.innerHeight-18
dropmenuobj.contentmeasure=dropmenuobj.offsetHeight
if (windowedge-dropmenuobj.y < dropmenuobj.contentmeasure){ //move up?
edgeoffset=dropmenuobj.contentmeasure+obj.offsetHeight
if ((dropmenuobj.y-topedge)<dropmenuobj.contentmeasure) //up no good either?
edgeoffset=dropmenuobj.y+obj.offsetHeight-topedge
}
}
return edgeoffset
}

function populatemenu(what){
if (ie4||ns6)
dropmenuobj.innerHTML=what.join("")
}


function dropdownmenu(obj, e, menucontents, menuwidth){
if (window.event) event.cancelBubble=true
else if (e.stopPropagation) e.stopPropagation()
clearhidemenu()
dropmenuobj=document.getElementById? document.getElementById("dropmenudiv") : dropmenudiv
populatemenu(menucontents)

if (ie4||ns6){
showhide(dropmenuobj.style, e, "visible", "hidden", menuwidth)

dropmenuobj.x=getposOffset(obj, "left")
dropmenuobj.y=getposOffset(obj, "top")
dropmenuobj.style.left=dropmenuobj.x-clearbrowseredge(obj, "rightedge")+"px"
dropmenuobj.style.top=dropmenuobj.y-clearbrowseredge(obj, "bottomedge")+obj.offsetHeight+"px"
}

return clickreturnvalue()
}

function clickreturnvalue(){
if (ie4||ns6) return false
else return true
}

function contains_ns6(a, b) {
while (b.parentNode)
if ((b = b.parentNode) == a)
return true;
return false;
}

function dynamichide(e){
if (ie4&&!dropmenuobj.contains(e.toElement))
delayhidemenu()
else if (ns6&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
delayhidemenu()
}

function hidemenu(e){
if (typeof dropmenuobj!="undefined"){
if (ie4||ns6)
dropmenuobj.style.visibility="hidden"
}
}

function delayhidemenu(){
if (ie4||ns6)
delayhide=setTimeout("hidemenu()",disappeardelay)
}

function clearhidemenu(){
if (typeof delayhide!="undefined")
clearTimeout(delayhide)
}

if (hidemenu_onclick=="yes")
document.onclick=hidemenu
function AddMileage()
	{
		document.getElementById(mileage).value = document.getElementById(odStart).value + document.getElementById(odEnd).value;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>

<body>
<cfquery name="getConfig" datasource="#session.datasource#">
SELECT * FROM config
</cfquery>
<cfset session.jobreceiver="#getConfig.jobapprover#">
<div id="headBar">&nbsp;</div>
<table width="1000" align="left" cellspacing="0" cellpadding="0"  style="margin-left:0px">
  <tr>
    <td rowspan="2" valign="middle"><img src="graphics/cls.gif" width="350" /> </td>
    <td valign="middle" align="right">&nbsp;
		<img src="graphics/service.gif" />
	</td>
  </tr>
  <tr>
    <td valign="bottom">
		<div class="topLinks">
			<table width="100%">
			  
			  <tr align="right">
				<td class="topLinks"><img src="graphics/application_home.png" align="absmiddle" /> <a href="default.cfm" class="navLinks">Home</a></td>
				<!--- <td><a href="construction.cfm" class="navLinks">Clients</a></td> --->
				<td class="topLinks"><img src="graphics/group.png" align="absmiddle" /> <a href="staff.cfm" class="navLinks">Staff</a></td>
				<td class="topLinks"><img src="graphics/page.png" align="absmiddle" /> <a href="services.cfm" class="navLinks">Services</a></td>
				<td class="topLinks"><img src="graphics/wrench.png" align="absmiddle" /> <a href="projects.cfm" class="navLinks">Projects</a></td>
				<!--- <td><a href="construction.cfm" class="navLinks">Pictures</a></td> --->
				<cfif #session.loggedin# EQ "no">
				  <td class="topLinks"><img src="graphics/lock_open.png" align="absmiddle" /> <a href="login.cfm" class="navLinks">Log In</a></td>
				</cfif>
				<td class="topLinks"><img src="graphics/email.png" align="absmiddle" /> <a href="contact.cfm" class="navLinks">Contact Us</a></td>
			  </tr>
			</table>
		</div>
	</td>
  </tr>
</table>




<cfif #session.loggedin# EQ "yes">
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
  SELECT viewed FROM projects WHERE viewed=0
  </cfquery>
  <cfset session.newJobs=#newJobs.recordcount#>
  <table width="1000" align="left" class="midTable" cellspacing="0">
    <tr> <cfoutput>
        <td align="left" class="loginNavTabl" >Logged in as <strong>#session.username#</strong>
          <cfswitch expression="#session.usertype#">
            <cfcase value="0">
            (Customer)
            </cfcase>
            <cfcase value="1">
            (Employee)
            </cfcase>
          </cfswitch>
        </td>
        <td align="right" class="loginNavTabl" valign="middle" ><cfswitch expression="#session.usertype#">
            <cfcase value="0">
            <!---Customer Nav Links --->
            <img src="graphics/application_home.png" align="absmiddle" /> <a href="customer-home.cfm" style="color:white">Customer Home</a> | <img src="graphics/cart_add.png" align="absmiddle" /> <a href="jobRequest.cfm" style="color:white">Request Job</a> | <img src="graphics/lock_edit.png" align="absmiddle" /> <a href="resetPassword.cfm" style="color:white">Change Password</a> | <img src="graphics/door_out.png" align="absmiddle"/> <a href="logoff.cfm" style="color:white">Log Out</a>
            </cfcase>
            <cfcase value="1">
            <!---Employee Nav Links --->
            <img src="graphics/wrench.png" align="absmiddle"/> <a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, jobTools, '150px')" onmouseout="delayhidemenu()">Job Tools</a> | <img src="graphics/user.png" align="absmiddle"/> <a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, custTools, '150px')" onmouseout="delayhidemenu()">Customer Tools</a> | <img src="graphics/group_edit.png" align="absmiddle"/> <a href="default.htm"  onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, accountTools, '150px')" onmouseout="delayhidemenu()">Account Tools</a> | <img src="graphics/door_out.png" align="absmiddle"/> <a href="logoff.cfm" >Log Out</a>
            </cfcase>
          </cfswitch>
        </td>
      </cfoutput> 
    </tr>
  </table>
</cfif>
</body>
</html>
