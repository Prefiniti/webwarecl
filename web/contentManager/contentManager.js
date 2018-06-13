function doUpload()
{
	window.open("","uploadStatusWindow","width=420,height=220,toolbar=0"); 
    var a = window.setTimeout("document.uploadFile.submit();",500)
}

function updateFileList(project_id)
{
	/* /contentManager/components/fileList.cfm */
	//alert('updateFileList() called.');
	AjaxLoadPageToDiv('fileList', 'http://www.centerlineservices.biz/contentManager/components/fileList.cfm?id=' + project_id);
	showDivC('fileList');
}

function viewFile(path)
{
	window.open(path,"fileViewWindow","width=1000,height=700,toolbar=0,menubar=1,scrollbars=1"); 
}

function deleteFile(path, projectID, fileID)
{
		var url;
		url = '/contentManager/components/fileDeleteConfirm.cfm?path=' + escape(path);
		url += '&projectID=' + escape(projectID);
		url += '&fileID=' + escape(fileID);
		
		AjaxLoadPageToDiv('tcTarget', url);
}

function doDelete(path, fileID, projectID)
{
		var url;
		url = '/contentManager/components/fileDeleteSubmit.cfm?path=' + escape(path);
		url += '&fileID=' + escape(fileID);
		url += '&projectID=' + escape(projectID);
		
		AjaxLoadPageToDiv('tcTarget', url);
}

function showFileBrowser(userid, projectID) 
{
	var url;
	url = '/contentManager/components/fileBrowser.cfm?clientid=' + escape(userid);
	
	if (projectID != 0) {
		url += '&projectID=' + escape(projectID);
	}
	
	
	
	showDiv('browserWrapper');
	AjaxLoadPageToDiv('browserWrapper', url);
}

function getFileList(projectid)
{
	var url;
	url = "/contentManager/components/fileListByProject.cfm?projectid=" + escape(projectid);
	url += "&sortorder=filePath&direction=ASC";
	AjaxLoadPageToDiv('projectList', url);
}

function getFileListSorted(projectid, sortorder)
{
	var url;
	url = "/contentManager/components/fileListByProject.cfm?projectid=" + escape(projectid);
	url += "&sortorder=" + escape(sortorder);
	url += "&direction=ASC";
	AjaxLoadPageToDiv('projectList', url);
}

function doPreview(filePath, fileID)
{
	var url;
	url = "/contentManager/components/autoPreview.cfm?filePath=" + escape(filePath);
	url += "&fileid=" + escape(fileID);
	
	SetInnerHTML('curFile', '<strong>' + filePath + '</strong>');
	SetValue('fid', filePath);
	AjaxLoadPageToDiv('picture', url);
	
}

function uploadSurveyMap(id)
{
	var url;
	url = "/contentManager/components/surveyMapUpload.cfm?subdivisionID=" + escape(id);
	
	AjaxLoadPageToDiv('tcTarget', url);
}