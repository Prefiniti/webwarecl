

/***********************************************
* AnyLink Drop Down Menu- © Dynamic Drive (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

var mnuUser=new Array()
var mnuCompany=new Array()

//Contents for menu 1 (CUSTOMER TOOLS)
var accountTools=new Array()
accountTools[0]='<a href="resetPassword.cfm">Change My Password</a>'
accountTools[1]='<a href="manageCustomers.cfm#addNew">Add New Account</a>'
accountTools[2]='<a href="manageCustomers.cfm#manageExisting">Edit Accounts</a>'
accountTools[3]='<a href="manageCompanies.cfm">Manage Companies</a>'
if (glob_isAdmin) {
	accountTools[4]='<a href="profileManager.cfm">Profile Manager</a>'
}

//Contents for menu 2, (JOB TOOLS)
var jobTools=new Array()
jobTools[0]='<a href="mycl-emp.cfm">MyCL Home</a>'
jobTools[1]='<a href="jobRequest.cfm">Order Services</a>'
jobTools[2]='<a href="checkOverdue.cfm">Send Delinquent Order Reminders</a>'
jobTools[3]='<a href="search.cfm">Search Projects</a>'
jobTools[4]='<a href="timeEntry.cfm?action=view">Time Entry</a>'
jobTools[5]='<a href="http://yuna.clogic-int.com/SoftwareProjects/AddProjectItem.cfm?id=9">Report Bug</a>'
jobTools[6]='<a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/news/createArticle.cfm\');">Create News Article</a>'

var custTools=new Array()
custTools[0]='<a href="forms/custRept.cfm" target="_blank">Customer Report</a>'
custTools[1]='<a href="compose.cfm">Write a Message</a>'
custTools[2]='<a href="inbox.cfm?mailbox=inbox">MyCL Mail</a>';

var ordersMenu=new Array()
ordersMenu[0]='<img src="/graphics/cart_go.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/workflow/components/surveyOrderFormOLD.cfm\');">Place Order...</a>'
if (glob_order_processor == 1) {
	ordersMenu[1]='<img src="/graphics/package_go.png"><a href="javascript:setListView;AjaxLoadPageToDiv(\'tcTarget\', \'jobViews/newJobs.cfm\');">Process New Orders...</a>'
}

var projectsMenu=new Array()
projectsMenu[0]='<img src="/graphics/folder_lightbulb.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'jobViews/priority.cfm\');">Priority Projects...</a>'
projectsMenu[1]='<img src="/graphics/chart_bar.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'workFlow/components/weeklyOrderStats.cfm\');">Project Statistics...</a>'
//projectsMenu[2]='<a href="##">Scheduling...</a>'
if (glob_order_processor == 1) {
	projectsMenu[2]='<img src="/graphics/package_go.png"><a href="javascript:setListView;AjaxLoadPageToDiv(\'tcTarget\', \'jobViews/newJobs.cfm\');">Process New Orders...</a>'
}

var gisMenu=new Array()
gisMenu[0]='<img src="/graphics/map.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/workflow/components/subdivisionList.cfm\');">Subdivisions...</a>'


/*var researchMenu=new Array()
researchMenu[0]='<img src="/graphics/map.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/workflow/components/subdivisionList.cfm\');">Maps...</a>'*/

var timeMenu=new Array()
timeMenu[0]='<img src="/graphics/time_add.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'tc/timesheet.cfm?action=add&userid=\' + glob_userid)">New Timesheet...</a>'
timeMenu[1]='<img src="/graphics/time_go.png"><a href="javascript:loadTimesheetView(\'tcTarget\', glob_userid, \'1/1/1980\', \'1/1/2999\', \'Open\', glob_isTCAdmin, \'\')">My Open Timesheets</a>'
timeMenu[2]='<img src="/graphics/time.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'tc/components/timesheetsByWeek.cfm\')">This Week</a>'
if (glob_isTCAdmin) {
	timeMenu[3]='<img src="/graphics/timeline_marker.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'tc/taskCodes.cfm\')">Manage Task Codes</a>'
}

var accountsMenu=new Array()
accountsMenu[0]='<img src="/graphics/user_edit.png"><a href="javascript:editUser(glob_userid);">Edit My Profile</a>'
accountsMenu[1]='<img src="/graphics/book.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/authentication/components/employeeDirectory.cfm\');">Employee Directory</a>'
accountsMenu[2]='<img src="/graphics/book.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/authentication/components/customerDirectory.cfm\');">Customer Directory</a>'
if (glob_isAdmin) {
	accountsMenu[3]='<img src="/graphics/user.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/authentication/components/profileManager.cfm\');">Profile Manager</a>'
	accountsMenu[4]='<img src="/graphics/user_add.png"><a href="javascript:addUser();">Add User Account</a>'
	accountsMenu[5]='<img src="/graphics/group_add.png"><a href="javascript:addCompany();">Add Company</a>'
}



var schedulingMenu=new Array()
schedulingMenu[0]='<img src="/graphics/date_magnify.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/scheduling/components/weeklySchedule.cfm\');">Weekly Schedule</a>'
if (glob_isAdmin) {
schedulingMenu[1]='<img src="/graphics/group_edit.png"><a href="javascript:loadCrewManager();">Crew Manager</a>'
schedulingMenu[2]='<img src="/graphics/date_add.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/scheduling/components/dispatchCrew.cfm\');">Dispatch Crew...</a>'
}
var mailMenu=new Array()
mailMenu[0]='<img src="/graphics/email_add.png"><a href="javascript:writeMessage();">Write a Message</a>'
mailMenu[1]='<img src="/graphics/folder_magnify.png"><a href="javascript:viewMailFolder(\'inbox\');">Inbox <strong>(' + glob_unreadMail + ' new)</strong></a>'
mailMenu[2]='<img src="/graphics/folder_magnify.png"><a href="javascript:viewMailFolder(\'sent messages\');">Sent Messages</a>'

var reportsMenu=new Array()
reportsMenu[0]='<img src="/graphics/report_go.png"><a href="forms/custRept.cfm" target="_blank">Customer Report</a>'

var toolsMenu=new Array()
toolsMenu[0]='<img src="/graphics/bug_add.png"><a href="http://www.centerlineservices.biz/bugzilla/enter_bug.cgi" target="_blank">Report Bug</a>'
toolsMenu[1]='<img src="/graphics/newspaper_add.png"><a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/news/createArticle.cfm\');">Create News Article</a>'
if (glob_site_maintainer == 1) {
	toolsMenu[2]='<img src="/graphics/server_chart.png"><a href="javascript:loadMaintenancePanel();">Site Maintenance</a>'
}

var custOrdersMenu=new Array()
custOrdersMenu[0]='<a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'/workflow/components/surveyOrderFormOLD.cfm\');">Request Services...</a>'
custOrdersMenu[1]='<a href="javascript:AjaxLoadPageToDiv(\'tcTarget\', \'jobViews/priorityCustomer.cfm?clientid=' + escape(glob_userid) + '\');">Priority Projects...</a>'

var custAcctMenu=new Array()
custAcctMenu[0]='<a href="javascript:editUser(glob_userid);">Edit My Profile...</a>'

var appMenu=new Array()
appMenu[0]='<img src="/graphics/help.png"><a href="javascript:loadHelp(\'About WebWare.CL\', \'about.html\', \'\');">About WebWare...</a>'
appMenu[1]='<img src="/graphics/page_refresh.png"><a href="javascript:location.reload()">Refresh</a>'
appMenu[2]='<img src="/graphics/lock_go.png"><a href="logoff.cfm" >Sign out...</a>'
appMenu[3]='<img src="/graphics/door.png"><a href="javascript:self.close()">Exit</a>'


var desktopMenu=new Array()
desktopMenu[0]='<img src="/graphics/images.png"><a href="##">Change desktop background...</a>'

		
var menuwidth='185px' //default menu width
var menubgcolor='white'  //menu bgcolor
var disappeardelay=250  //menu disappear speed onMouseout (in miliseconds)
var hidemenu_onclick="yes" //hide menu when user clicks within menu?

/////No further editting needed

var ie4 = document.all;
var ns6 = document.getElementById && !document.all;

if (ie4 || ns6)
	document.write('<div id="dropmenudiv" style="visibility:hidden;width:'+menuwidth+';background-color:'+menubgcolor+'" onMouseover="clearhidemenu()" onMouseout="dynamichide(event)"></div>');

function getposOffset(what, offsettype)
{
	var totaloffset = (offsettype == "left") ? what.offsetLeft : what.offsetTop;
	var parentEl = what.offsetParent;
	
	while (parentEl != null) {
		totaloffset = (offsettype == "left")? totaloffset + parentEl.offsetLeft : totaloffset + parentEl.offsetTop;
		parentEl = parentEl.offsetParent;
	}
	
	return totaloffset;
}


function showhide(obj, e, visible, hidden, menuwidth)
{
	if (ie4 || ns6)
		dropmenuobj.style.left=dropmenuobj.style.top = "-500px";
	
	if (menuwidth != "") {
		dropmenuobj.widthobj = dropmenuobj.style;
		dropmenuobj.widthobj.width = menuwidth;
	}

	if (e.type == "click" && obj.visibility == hidden || e.type == "mouseover")
		obj.visibility = visible;
	else if (e.type == "click")
		obj.visibility = hidden;
}

function iecompattest()
{
	return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body;
}

function clearbrowseredge(obj, whichedge)
{
	var edgeoffset = 0;
	
	if (whichedge == "rightedge") {
		var windowedge = ie4 && !window.opera ? iecompattest().scrollLeft + iecompattest().clientWidth - 15 : window.pageXOffset + window.innerWidth - 15;
		
		dropmenuobj.contentmeasure=dropmenuobj.offsetWidth;
		if (windowedge - dropmenuobj.x < dropmenuobj.contentmeasure)
			edgeoffset = dropmenuobj.contentmeasure - obj.offsetWidth;
	}
	else {
		var topedge = ie4 && !window.opera? iecompattest().scrollTop : window.pageYOffset;
		var windowedge = ie4 && !window.opera? iecompattest().scrollTop+iecompattest().clientHeight-15 : window.pageYOffset + window.innerHeight - 18;
		
		dropmenuobj.contentmeasure = dropmenuobj.offsetHeight;
		if (windowedge - dropmenuobj.y < dropmenuobj.contentmeasure) { //move up?
			edgeoffset = dropmenuobj.contentmeasure + obj.offsetHeight;
		
			if ((dropmenuobj.y - topedge) < dropmenuobj.contentmeasure) //up no good either?
				edgeoffset = dropmenuobj.y + obj.offsetHeight - topedge;
		}
	}
	return edgeoffset;
}

function populatemenu(what)
{
	if (ie4 || ns6)
		dropmenuobj.innerHTML = what.join("");
}


function dropdownmenu(obj, e, menucontents, menuwidth)
{
	if (window.event) 
		event.cancelBubble = true;
	else if (e.stopPropagation) 
		e.stopPropagation();
		
	clearhidemenu();
	dropmenuobj = document.getElementById ? document.getElementById("dropmenudiv") : dropmenudiv;
	populatemenu (menucontents);

	if (ie4 || ns6) {
		showhide(dropmenuobj.style, e, "visible", "hidden", menuwidth);

		dropmenuobj.x = getposOffset(obj, "left");
		dropmenuobj.y = getposOffset(obj, "top");
		dropmenuobj.style.left = dropmenuobj.x - clearbrowseredge(obj, "rightedge") + "px";
		dropmenuobj.style.top = dropmenuobj.y - clearbrowseredge(obj, "bottomedge") + obj.offsetHeight + "px";
	}

	return clickreturnvalue();
}

function clickreturnvalue()
{
	if (ie4 || ns6) 
		return false;
	else 
		return true;
}

function contains_ns6(a, b) 
{
	while (b.parentNode)
		if ((b = b.parentNode) == a)
			return true;
		else
			return false;
}

function dynamichide(e)
{
	if (ie4 && !dropmenuobj.contains(e.toElement))
		delayhidemenu();
	else if (ns6 && e.currentTarget != e.relatedTarget && !contains_ns6(e.currentTarget, e.relatedTarget))
		delayhidemenu();
}

function hidemenu(e)
{
	if (typeof dropmenuobj != "undefined") {
		if (ie4 || ns6)
			dropmenuobj.style.visibility = "hidden";
	}
}

function delayhidemenu()
{
	if (ie4 || ns6)
		delayhide = setTimeout("hidemenu()", disappeardelay);
}

function clearhidemenu()
{
	if (typeof delayhide != "undefined")
		clearTimeout(delayhide);
}

if (hidemenu_onclick == "yes")
	document.onclick = hidemenu;
	
function userDropDown(obj, e, userid, longName)
{
	mnuUser[0] = '<img src="/graphics/user_go.png"><a href="javascript:viewProfile(' + userid + ');">View Profile</a>';
	mnuUser[1] = '<img src="/graphics/email_go.png"><a href="javascript:mailTo(' + userid + ', \'' + longName + '\');">Send Message</a>';
	
	if (glob_isAdmin) {
		mnuUser[2] = '<img src="/graphics/user_edit.png"><a href="javascript:editUser(' + userid + ');">Edit Profile</a>';
	}
	dropdownmenu(obj, e, mnuUser, '150px');
}

function companyDropDown(obj, e, companyid, longName)
{
	if (glob_isAdmin) {
		mnuCompany[0] = '<img src="/graphics/user_go.png"><a href="javascript:editCompany(' + companyid + ');">Edit Company</a>';
		dropdownmenu(obj, e, mnuCompany, '150px');
	}
	
	
}
	
