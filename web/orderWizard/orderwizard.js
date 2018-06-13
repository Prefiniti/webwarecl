function loadOWStep(id, stepnum)
{
	var url;
	url = "/orderWizard/components/step" + stepnum + ".cfm?id=" + escape(id);
	url += "&back=" + escape(stepnum - 1);
	url += "&step=" + escape(stepnum);
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function writeStep(id, stepnum)
{
		var url;
		url = "/orderWizard/components/submit.cfm?id=" + escape(id);
		url += "&step=" + escape(stepnum);
		
		switch (stepnum) 
		{
			case 2:
				url += "&description=" + GetValue('description');
				break;
			case 3:
				
				
				break;
			case 4:
				
				break;
			case 5:
				
				break;
			case 6:
				
				break;
			case 7:
			
				break;
		}
		AjaxNullRequest(url);
		loadOWStep(id, stepnum + 1);
			
}