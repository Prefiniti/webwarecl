
function sendNotification(statusDiv, notificationType, userid, subject, bodyText)
{
	var url;
	url = "/notification/components/notificationSubmit.cfm?userid=" + userid;
	url += "&notificationType=" + notificationType;
	url += "&subject=" + escape(subject);
	url += "&bodyText=" + escape(bodyText);
	
	if (statusDiv != 0) {
		AjaxLoadPageToDiv(statusDiv, url);
	}
	else {
		AjaxNullRequest(url);
	}
	
}

function sendText(toUserID, textBody)
{
	var url;
	url = "/notification/components/sendText.cfm?to=" + escape(toUserID);
	url += "&message=" + escape(textBody);
	url += "&from=" + escape(glob_userid);
	
	var divStr;
	divStr = "sendText_" + toUserID;
	
	AjaxLoadPageToDiv(divStr, url);
}