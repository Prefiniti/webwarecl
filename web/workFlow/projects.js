// JavaScript Document

function editProjectNumber()
{
	showDiv('jobNumRW');
	hideDiv('jobNumRO');
}

function saveProjectNumber(project_id, newProjectNumber)
{
	var url;
	url = '/workFlow/components/projectNumberSub.cfm?id=' + project_id;
	url += '&clsJobNumber=' + escape(newProjectNumber);
	
	showDiv('jobNumRO');
	hideDiv('jobNumRW');
	
	if (newProjectNumber != "") {
		SetInnerHTML('jnView', newProjectNumber);
	}
	else {
		SetInnerHTML('jnView', '[None Assigned]');
	}
	
	SetValue('jobNumRW', newProjectNumber);
	
	
	AjaxNullRequest(url);
	
	if (newProjectNumber != "") {
		showMessage('Edit Project Number', 'Project number set to ' + newProjectNumber.toString());
	}
	else {
		showMessage('Edit Project Number', 'Project number removed.');
	}
}

function updateLocationInfo(statusDiv, project_id, address, city, 
							state, zip, latitude, longitude, subdivision, lot, block, 
							section, township, range)
{
	var url;
	url = '/workFlow/components/locationInfoSub.cfm?id=' + project_id;
	url += '&address=' + escape(address);
	url += '&city=' + escape(city);
	url += '&state=' + escape(state);
	url += '&zip=' + escape(zip);
	url += '&latitude=' + latitude;
	url += '&longitude=' + longitude;
	url += '&subdivision=' + escape(subdivision);
	url += '&lot=' + escape(lot);
	url += '&block=' + escape(block);
	url += '&section=' + escape(section);
	url += '&township=' + escape(township);
	url += '&range=' + escape(range);
	
	
	AjaxLoadPageToDiv(statusDiv, url);
}

function updateFilingInfo(statusDiv, project_id, SubdivisionOrDeed, FilingType, PlatCabinetBook,
						  PageOrSlide, PageSlide, ReceptionNumber, FilingDate, CertifiedTo)
{
	var url;
	url = '/workFlow/components/filingInfoSub.cfm?id=' + project_id;
	url += '&SubdivisionOrDeed=' + escape(SubdivisionOrDeed);
	url += '&FilingType=' + escape(FilingType);
	url += '&PlatCabinetBook=' + escape(PlatCabinetBook);
	url += '&PageOrSlide=' + escape(PageOrSlide);
	url += '&PageSlide=' + escape(PageSlide);
	url += '&ReceptionNumber=' + escape(ReceptionNumber);
	url += '&FilingDate=' + escape(FilingDate);
	url += '&CertifiedTo=' + escape(CertifiedTo);
	
	AjaxLoadPageToDiv(statusDiv, url);
}

function updateOtherInfo(statusDiv, project_id, specialinstructions)
{
	var url;
	url = '/workFlow/components/otherInfoSub.cfm?id=' + project_id;
	url += '&specialinstructions=' + escape(specialinstructions);
	
	AjaxLoadPageToDiv(statusDiv, url);
}

function setProjectStatus(jobID, statusDiv)
{
	var url;
	
	url = '/workFlow/components/projectStatusSub.cfm?id=' + jobID + '&status=';
	url += AjaxGetCheckedValue('status') + '&SubStatus=' + AjaxGetCheckedValue('SubStatus');
	
	AjaxNullRequest(url);
	
	showMessage('Update Project Status', 'Project status has been updated, customer notified.');
}

function deleteProject(project_id)
{
	AjaxLoadPageToDiv('tcTarget', '/workFlow/components/deleteJobConfirm.cfm?id=' + escape(project_id));	
}

function deleteProjectReal(project_id)
{
	AjaxLoadPageToDiv('tcTarget', '/workFlow/components/delJob.cfm?jobid=' + escape(project_id));
}

function viewPrintable(project_id)
{
	var url;
	url = '/forms/docViewer.cfm?pageTarget=/forms/viewJob.cfm?jobid=' + project_id;
	
	window.open(url,"printView","width=800,height=800,toolbar=0,menubar=1"); 
}

function invalidateSection(statusDiv)
{
	SetInnerHTML(statusDiv, '<font color="red">Save needed.</font>');
}

function validateSection(statusDiv)
{
	SetInnerHTML(statusDiv, '<font color="#33FF00">No changes made since last save.</font>');
}

function loadProjectViewer(id)
{
	var url;
	url = "/workFlow/components/projectViewer.cfm?id=" + id;

	AjaxLoadPageToDiv('tcTarget', url);
}

function assignDrafter(projectID, drafterID)
{
	var url;
	url = "/workflow/components/assignDrafter.cfm?projectID=" + escape(projectID);
	url += "&drafterID=" + escape(drafterID);
	
	AjaxLoadPageToDiv('cur_drafter', url);
	hideDiv('drafterSelect');
}

function assignSurveyor(projectID, surveyorID)
{
	var url;
	url = "/workflow/components/assignSurveyor.cfm?projectID=" + escape(projectID);
	url += "&surveyorID=" + escape(surveyorID);
	
	AjaxLoadPageToDiv('cur_surveyor', url);
	hideDiv('surveyorSelect');
}

function setValueLcl()
{
	document.getElementById("subText").value=document.getElementById("subList").value;
}

function setProjectType(ptype)
{
	if(ptype == 'Survey') {
		showDiv('Survey');
		hideDiv('Construction');
	}
	else {
		showDiv('Construction');
		hideDiv('Survey');
	}
}

<!--function SetValue(ctlID, newValue)-->

function DeedBook()
{
	SetValue('SubdivisionOrDeed', 'Deed');
	SetValue('FilingType', 'Book');
}

function SubdivisionBook()
{
	SetValue('SubdivisionOrDeed', 'Subdivision');
	SetValue('FilingType', 'Book');
}

function SubdivisionCabinet()
{
	SetValue('SubdivisionOrDeed', 'Subdivision');
	SetValue('FilingType', 'Cabinet');
}

function SubdivisionPlat()
{
	SetValue('SubdivisionOrDeed', 'Subdivision');
	SetValue('FilingType', 'Plat');
}

function hideAllDocuments()
{
	hideDiv('divScopeOfServices');
	hideDiv('divRateSchedule');
	hideDiv('divTimeline');
	hideDiv('divTotalCost');
	hideDiv('divContract');
}

function chooseDocument()
{
	hideAllDocuments();
	
	var divStr;
	divStr = 'div' + GetValue('sectionSel');
	
	showDiv(divStr);
	
}

function acceptRFP(id)
{
	var url;
	url = '/workflow/components/acceptRFP.cfm?id=' + escape(id);
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function declineRFP(id)
{
	var url;
	url = '/workflow/components/declineRFP.cfm?id=' + escape(id);
	
	AjaxLoadPageToDiv('tcTarget', url);
}


