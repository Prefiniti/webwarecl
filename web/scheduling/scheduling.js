// JavaScript Document

function loadCrewManager()
{
	var url="/scheduling/components/crewManager.cfm";
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function editCrew(id)
{
	var url;
	url = "/scheduling/components/editCrew.cfm?id=" + escape(id);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function deleteCrew(id)
{
	var url;
	url = "/scheduling/components/deleteCrewConfirm.cfm?id=" + escape(id);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function addCrew()
{
	var url;
	url = "/scheduling/components/addCrew.cfm";
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function createCrew(name)
{
	var url;
	url = "/scheduling/components/addCrewSubmit.cfm?name=" + escape(name);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function addUserToCrew(crewid, userid)
{
	var url;
	url = "/scheduling/components/addUserToCrewSubmit.cfm?crewid=" + escape(crewid);
	url += "&userid=" + escape(userid);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}


function deleteUserFromCrew(crewid, userid)
{
	var url;
	url = "/scheduling/components/deleteFromCrew.cfm?crewid=" + escape(crewid);
	url += "&userid=" + escape(userid);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function setCrewChief(crewid, userid, ischief) 
{
	var url;
	url = "/scheduling/components/setCrewChief.cfm?crewid=" + escape(crewid);
	url += "&userid=" + escape(userid);
	url += "&ischief=" + escape(ischief);
	
	AjaxNullRequest(url);
}

function dispatchCrew(crewid, dateTime, endDateTime, clsJobNumber, instructions)
{
	var url;
	url = "/scheduling/components/dispatchCrewSubmit.cfm?crewid=" + escape(crewid);	
	url += "&dateTime=" + escape(dateTime);
	url += "&clsJobNumber=" + escape(clsJobNumber);
	url += "&instructions=" + escape(instructions);
	url += "&endDateTime=" + escape(endDateTime);
	
	AjaxLoadPageToDiv("userActionTarget", url);
}

function checkConflicts(crewid, dateTime, dateTimeEnd)
{
	var url;
	url = "/scheduling/components/deconflict.cfm?crewid=" + escape(crewid);
	url += "&dateTime=" + escape(dateTime);
	url += "&dateTimeEnd=" + escape(dateTimeEnd);
	
	//alert(url);
	
	AjaxLoadPageToDiv('conflicts', url);
}