function minLength(chkCtl, errDiv, minLength, subChk)
{
	var e;
	e = AjaxGetElementReference(errDiv);


	var curLen;
	var charsNeeded;
	curLen = GetValue(chkCtl).length;
	charsNeeded = minLength - curLen;
	
	if (curLen < minLength)
	{
		SetInnerHTML(errDiv, '<font color="red"><img src="/graphics/error.png" align="top"> You need ' + charsNeeded.toString() + ' more characters.</font>');
		if (subChk)
		{
			alert('You must enter a minimum of ' + minLength.toString() + ' characters in the ' + chkCtl.toString() + ' field.');
			
		}
		return false;
	}
	else
	{
		SetInnerHTML(errDiv, '<font color="green"><img src="/graphics/accept.png" align="top"> Length requirements satisfied.</font>');
		return true;
	}
	
	
	
}