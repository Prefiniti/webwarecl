var nextToClose;
nextToClose=null;
	
function showDivC(which) 
{
	var imgOld;
	var imgNew;
	
	if (nextToClose != null) {
		imgOld = nextToClose + "Btn";
		document.getElementById(imgOld).style.backgroundImage="url(http://webwarecl.prefiniti.com/MyCL/components/tabgrad.gif)";
		if (document.getElementById("KeepTabsOpen").checked == false) {
			document.getElementById(nextToClose).style.display="none";
		}
	}
	imgNew = which + "Btn";
	document.getElementById(imgNew).style.backgroundImage="url(http://webwarecl.prefiniti.com/MyCL/components/tabgrad-h.gif)";
	document.getElementById(which).style.display="inline";
	nextToClose=which;
	soundManager.play('click');
}
function hideDivC(which) 
{
	soundManager.play('click');
	document.getElementById(which).style.display="none";
	
	
}
function SwapShown(which)
{
	if (document.getElementById(which).style.display == "none") {
		showDivC(which);
	}
	else {
		hideDivC(which);
	}
}