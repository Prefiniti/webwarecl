function writeMessage()
{
	var url;
	url = '/mail/components/writeMessage.cfm';
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function mailTo(toID, longName)
{
	var url;
	url = '/mail/components/writeMessage.cfm?toID=' + escape(toID);
	url += "&longName=" + escape(longName);
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function sendMessage(fromUser, toUser, refJobID, subject, bodyText, readReceipt)
{
	var url;
	var rrStr;
	url = "/mail/components/writeMessageSubmit.cfm?fromuser=" + escape(fromUser);
	url += "&touser=" + escape(toUser);
	url += "&tsubject=" + escape(subject);
	url += "&refJobID=" + escape(refJobID);
	url += "&tbody=" + escape(bodyText);
	
	if (readReceipt == true) {
		url += "&readReceipt=1";
	}
	else {
		url += "&readReceipt=0";
	}
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function viewMailFolder(box)
{
	var url;
	url = "/mail/components/viewMailFolder.cfm?userid=" + escape(glob_userid);
	url += "&mailbox=" + escape(box);
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function viewMessage(id)
{
	var url;
	url = "/mail/components/viewMessage.cfm?id=" + escape(id);
	
	AjaxLoadPageToDiv('tcTarget', url);
}


