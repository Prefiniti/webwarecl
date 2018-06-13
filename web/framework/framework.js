var navSidebars = new Array();
var navPos = 0;
var saveNeeded = false;
var tabs = new Array();
var tabCount = 0;


function closeWebware()
{
	var url;
	url = "/framework/components/exitWebwareConfirm.cfm";
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function loadSidebar(sidebarName)
{
	//return;
	var url;
	url = "framework/sb_" + sidebarName + ".cfm?supressApplication=true";
	
	navSidebars[navPos] = sidebarName;
	navPos++;
	
	AjaxLoadPageToDiv('sbTarget', url);

}

function loadContentBar(url)
{
	AjaxLoadPageToDiv('tcTarget', url);	
}

function loadHome()
{
	AjaxLoadPageToDiv('tcTarget', '/framework/homeView.cfm');
}

function loadContext(sideBar, contentBar)
{
	loadSidebar(sideBar);
	loadContentBar(contentBar);
}

function navigateBack()
{
	if (navSidebars > 0) {
		loadSidebar(navSidebars[navPos - 1]);
	}	
}

function navigateForward()
{
	if (navSidebars < navPos) {
		loadSidebar(navSidebars[navPos + 1]);
	}
}

function setSessionVariable(varName, varValue)
{
	url = 'framework/setSession.cfm?varName=' + varName + '&varValue=' + varValue + "&supressApplication=true";
	//alert(url);
	AjaxNullRequest(url);
}

function hideItemAttention()
{
	hideDiv('itemAttention'); 
	showDiv('showImp');
	setSessionVariable('itemAttention', 'false');
}

function showItemAttention()
{
	showDivBlock('itemAttention'); 
	hideDiv('showImp');
	setSessionVariable('itemAttention', 'true');
}

function popupDate(ctl)
{
	//var tsDate = new calendar2(document.forms['tsHeader'].elements['date']);
	var tsDate = new calendar2(ctl);
	
	tsDate.popup();
}

function popupDateTime(ctl)
{
	BUL_TIMECOMPONENT = true;
	//var tsDate = new calendar2(document.forms['tsHeader'].elements['date']);
	var tsDate = new calendar2(ctl);
	
	tsDate.popup();
}

function showMessage(msgTitle, msgText)
{
	
	SetInnerHTML('gMsgTitle', msgTitle);
	SetInnerHTML('gMsgText', msgText);
	
	showDiv('gMsg');
	showDiv('scrFade');
	soundManager.play('click');
	
}

function setListView()
{
	showDiv('tcTarget');
	hideDiv('mapTarget');
	setClass('listViewBtn', 'tabButtonActive');
	setClass('mapViewBtn', 'tabButtonInactive');
	
	//hideDiv('newsTarget');
	//setClass('newsViewBtn', 'tabButtonInactive');
}

function setMapView()
{
	hideDiv('tcTarget');
	showDiv('mapTarget');
	setClass('mapViewBtn', 'tabButtonActive');
	setClass('listViewBtn', 'tabButtonInactive');
	//hideDiv('newsTarget');
	//setClass('newsViewBtn', 'tabButtonInactive');
}

function setNewsView()
{
	hideDiv('tcTarget');
	hideDiv('mapTarget');
	showDiv('newsTarget');
	setClass('mapViewBtn', 'tabButtonInactive');
	setClass('listViewBtn', 'tabButtonInactive');
	setClass('newsViewBtn', 'tabButtonActive');
}

function setClass(target, className)
{
	try {
	var thediv = document.getElementById(target);
	thediv.className = className;
	}
	catch (error) 
	{
		
	}
}

function loadHomeView()
{
	AjaxLoadPageToDiv('tcTarget', '/framework/homeView.cfm');
}

/*<div id="tabBars" class="tabBar">
<span class="tabButtonActive" id="listViewBtn"><a href="javascript:setListView();">Project View</a></span>*/

function addTabButton(tabID, targetDivID, caption, active) 
{
  var ni = document.getElementById('tabBars');
  var newSpan = document.createElement('span');
  
  newSpan.setAttribute('id', tabID);
  newSpan.innerHTML = caption;
  
  ni.appendChild(newSpan);
  setClass(tabID, 'tabButtonInactive');
}

function setActiveTab(targetTabID, targetDivID)
{
	
}

function handleAppResize()
{
	var refContentBar;
	var refSideBar;
	var refApp;
	
	var pelWidth;
	
	refContentBar = document.getElementById('stWrapper');
	refSideBar = document.getElementById('sbWrapper');
	refApp = document.getElementById('appArea');
	
	pelWidth = f_clientWidth() - parseInt(refSideBar.style.width) - 60;
	
	
	
	refContentBar.style.width = pelWidth.toString() + "px";
}

function handleAppUnload()
{
	//alert('handleAppUnload();');	
}

function rtEventListener()
{
	//alert('event listener');
	var url;
	url = '/framework/components/getEvents.cfm?targetUser=' + escape(glob_userid);
	AjaxLoadPageToPopup(url);
	AjaxSilentLoad('clock', '/clock/clock.cfm');
	AjaxSilentLoad('newMailIcon', '/mail/components/mailStatus.cfm');
	AjaxSilentLoad('updateIcon', '/framework/components/updateStatus.cfm');
	enableRTEventListener();
}

function enableRTEventListener()
{
	var b = window.setTimeout("rtEventListener();",500);
}

function setMasthead(value)
{
	var url;
	url = "/framework/setMasthead.cfm?value=" + escape(value);
	url += "&userid=" + escape(glob_userid);
	
	AjaxNullRequest(url);
	
	if (value == 0) {
		showDiv('mastHead');
	}
	else {
		hideDiv('mastHead');
	}
}

function sendIM(targetUser, message)
{
	var url;
	url = "/framework/components/sendIM.cfm?fromid=" + escape(glob_userid);
	url += "&toid=" + escape(targetUser);
	url += "&body=" + escape(message);
	
	AjaxNullRequest(url);
	hideDiv('sendIMd');
	
}

function DoSearch(str, currentUserOnly)
{
	var url;
	var sfield;
	var stype;
	
	sfield = AjaxGetCheckedValue("SearchField");
	stype = AjaxGetCheckedValue("SearchType");
	
	url = "/forms/searchSubSmall.cfm?SearchType=";
	url += stype;
	url += "&SearchField=";
	url += sfield;
	url += "&SearchValue=";
	url += escape(str);
	url += "&currentUserOnly=" + escape(currentUserOnly);
	url += "&userid=" + escape(glob_userid);

	//alert(url);
	AjaxLoadPageToDiv("tcTarget", url);
	
	window.scrollTo(0, 0);
	document.getElementById('appArea').scrollTop = 0;
}

function f_clientWidth() {
	return f_filterResults (
		window.innerWidth ? window.innerWidth : 0,
		document.documentElement ? document.documentElement.clientWidth : 0,
		document.body ? document.body.clientWidth : 0
	);
}
function f_clientHeight() {
	return f_filterResults (
		window.innerHeight ? window.innerHeight : 0,
		document.documentElement ? document.documentElement.clientHeight : 0,
		document.body ? document.body.clientHeight : 0
	);
}
function f_scrollLeft() {
	return f_filterResults (
		window.pageXOffset ? window.pageXOffset : 0,
		document.documentElement ? document.documentElement.scrollLeft : 0,
		document.body ? document.body.scrollLeft : 0
	);
}
function f_scrollTop() {
	return f_filterResults (
		window.pageYOffset ? window.pageYOffset : 0,
		document.documentElement ? document.documentElement.scrollTop : 0,
		document.body ? document.body.scrollTop : 0
	);
}
function f_filterResults(n_win, n_docel, n_body) {
	var n_result = n_win ? n_win : 0;
	if (n_docel && (!n_result || (n_result > n_docel)))
		n_result = n_docel;
	return n_body && (!n_result || (n_result > n_body)) ? n_body : n_result;
}

