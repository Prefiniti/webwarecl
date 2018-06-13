<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Project Files</title>
<link href="centerline.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table style="border:1px solid silver" cellpadding="0"><tr><td>

<cfquery name="qryGetJobNumber" datasource="#session.datasource#">
SELECT * FROM projects WHERE id='#URL.jobid#'
</cfquery>
<cfquery name="qryGetJobFiles" datasource="#session.datasource#">
SELECT * FROM files WHERE projectID='#url.jobid#'
</cfquery>
<cfquery name="qryGetCustInf" datasource="#session.datasource#">
SELECT * FROM users WHERE id='#url.custid#'
</cfquery>
<cfquery name="jc" datasource="#session.datasource#">
SELECT id FROM jobNotes WHERE jobid='#url.jobid#'
</cfquery>
<cfquery name="setViewed" datasource="#session.datasource#">
	UPDATE projects SET viewed=1 WHERE id='#URL.jobid#'
</cfquery>
<table width="900" class="midTable" align="left" cellpadding="0" style="margin:0px;"> <!---outer table--->
  <tr>
    <td>
<cfoutput>	


<table width="100%" align="center" cellspacing="0"> <!---project home table--->
        <tr>
          <th class="subHeadNew" width="655" rowspan="3" align="center"><center><h1>Project Home Page</h1><img src="graphics/printer.png" align="absmiddle"/><a href="forms/viewJob.cfm?jobid=#url.jobid#" target="_blank" style="color:white">Printable Order</a> | <img src="graphics/note.png" align="absmiddle"/><a href="jobNotes.cfm?jobid=#url.jobid#&custid=#url.custid#" style="color:white">Project Notes (#jc.RecordCount# notes posted)</a> | <img src="graphics/delete.png" align="absmiddle" /><a href="deleteJobConfirm.cfm?jobid=#url.jobid#&custid=#url.custid#" style="color:white">Delete Project</a> | <img src="graphics/zoom.png" align="middle" /> <a href="projectView.cfm?id=#url.jobid#" style="color:white"> New View</a>  <font color="red" style="font-size:xx-small; font-weight:lighter;">[beta]</font><br /></center></th>
          <th class="subHeadNew" width="355"><strong>Customer:</strong> <a href="employeeinfo.cfm?id=#url.custid#" style="color:white">#qryGetCustInf.longName#</a></th>
        </tr>
        <tr>
          <th class="subHeadNew"><strong>Project:</strong> #qryGetJobNumber.description#</th>
        </tr>
        <tr>
          <td class="subHeadNew"><strong>Project Number:</strong> 
              <cfif #qryGetJobNumber.clsJobNumber# NEQ "">
                #qryGetJobNumber.clsJobNumber#<br /><a href="assignJobNumber.cfm?jobid=#url.jobid#&custid=#url.custid#" style="color:white">Click here to change Project number</a>
                <cfelse>
                <a href="assignJobNumber.cfm?jobid=#url.jobid#&custid=#url.custid#" style="color:white">Click here to assign Project number</a>
              </cfif>           </td>
        </tr>
		
        
			<form name="editJob" action="editJob_sub.cfm?jobid=#url.jobid#&custid=#url.custid#" method="post">
			<tr>
          <td class="int">Customer's Project Number:</td>
            <td class="int"><input name="clientJobNumber" type="text" value="#qryGetJobNumber.clientJobNumber#" size="50" /></td>
            </tr>
          <tr>
            <td class="int">Project Type:</td>
            <td class="int"><input name="jobType" type="text" value="#qryGetJobNumber.jobType#" size="50" /></td>
          </tr>
          <tr>
            <td class="int">Street Address:</td>
            <td class="int"><input name="address" type="text" value="#qryGetJobNumber.address#" size="50" /></td>
          </tr>
		  <tr>
            <td class="int">City:</td>
            <td class="int"><input name="city" type="text" value="#qryGetJobNumber.city#" size="50" /></td>
          </tr>
		  <tr>
            <td class="int">State:</td>
            <td class="int"><input name="state" type="text" value="#qryGetJobNumber.state#" size="50" /></td>
          </tr>
		  <tr>
            <td class="int">ZIP:</td>
            <td class="int"><input name="zip" type="text" value="#qryGetJobNumber.zip#" size="50" /></td>
          </tr>
          <tr>
            <td class="int">Due Date:</td>
            <td class="int"><input name="duedate" id="duedate" type="text" value="#DateFormat(qryGetJobNumber.duedate, 'mm/dd/yyyy')#" size="50" readonly /> <a href="javascript:dueDateCal.popup();"><img src="graphics/date.png" border="0" /></a></td>
          </tr>
          <tr>
            <td class="int">Subdivision:</td>
            <td class="int"><input name="subdivision" type="text" value="#qryGetJobNumber.subdivision#" size="50" /></td>
          </tr>
          <tr>
            <td class="int">Lot:</td>
            <td class="int"><input name="lot" type="text" value="#qryGetJobNumber.lot#" size="50"/></td>
          </tr>
          <tr>
            <td class="int">Block:</td>
            <td class="int"><input name="block" type="text" value="#qryGetJobNumber.block#" size="50" /></td>
          </tr>
          <tr>
            <td class="int">Section:</td>
            <td class="int"><input name="section" type="text" value="#qryGetJobNumber.section#" size="50" /></td>
          </tr>
          <tr>
            <td class="int">Township:</td>
            <td class="int"><input name="township" type="text" value="#qryGetJobNumber.township#" size="50" />           </td>
          </tr>
          <tr>
            <td class="int">Range:</td>
            <td class="int"><input name="range" type="text" size="50" value="#qryGetJobNumber.range#" /></td>
          </tr>
		  <tr>
            <td class="int">Filing Information:
					<blockquote>
					<p>
						    <label>
						      <input type="radio" name="SubdivisionOrDeed" value="Subdivision" <cfif #qryGetJobNumber.SubdivisionOrDeed# EQ "Subdivision">checked</cfif> />
						      Subdivision</label>
						    <br />
						    <label>
						      <input type="radio" name="SubdivisionOrDeed" value="Deed" <cfif #qryGetJobNumber.SubdivisionOrDeed# EQ "Deed">checked</cfif> />
						      Deed</label>
						    <br />
				      </p>
					 <p>
				      <label>
				        <input type="radio" name="FilingType" value="Plat" <cfif #qryGetJobNumber.FilingType# EQ "Plat">checked</cfif>/>
				        Plat</label>
				      <br />
				      <label>
				        <input type="radio" name="FilingType" value="Cabinet"  <cfif #qryGetJobNumber.FilingType# EQ "Cabinet">checked</cfif>/>
				        Cabinet</label>
				      <br />
				      <label>
				        <input type="radio" name="FilingType" value="Book"  <cfif #qryGetJobNumber.FilingType# EQ "Book">checked</cfif>/>
				        Book</label>
				      <br />
			      </p>
				  </blockquote>			  </td>
            <td class="int"><input type="text" name="PlatCabinetBook" value="#qryGetJobNumber.PlatCabinetBook#"/>			</td>
          </tr>
		  <tr>
            <td class="int"> <blockquote><p><label>
						      <input type="radio" name="PageOrSlide" value="Page" <cfif #qryGetJobNumber.PageOrSlide# EQ "Page">checked</cfif>/>
						      Page</label>
						    <br />
						    <label>
						      <input type="radio" name="PageOrSlide" value="Slide" <cfif #qryGetJobNumber.PageOrSlide# EQ "Slide">checked</cfif>/>
						      Slide</label>
						    <br />
						    </p></blockquote></td>
            <td class="int"><input type="text" name="PageSlide" value="#qryGetJobNumber.PageSlide#" /></td>
          </tr>
		  <tr>
            <td class="int">Reception Number:</td>
            <td class="int"><input type="text" name="ReceptionNumber" size="50" value="#qryGetJobNumber.ReceptionNumber#" /></td>
          </tr>
		 
		  <tr>
            <td class="int">Filing Date:</td>
            <td class="int"><input type="text" name="FilingDate" id="filingdate" size="50" value="#DateFormat(qryGetJobNumber.FilingDate, 'mm/dd/yyyy')#"  /> <a href="javascript:filingDateCal.popup();"><img src="graphics/date.png" border="0" /></a></td>
          </tr>
		   <tr>
            <td class="int">Certified To:</td>
            <td class="int"><input type="text" name="CertifiedTo" size="50" value="#qryGetJobNumber.CertifiedTo#" /></td>
          </tr>
		  <tr>
            <td class="int">Other Project Information:</td>
            <td class="int"><input name="specialinstructions" value="#qryGetJobNumber.specialinstructions#" size="50" /></td>
          </tr>
		  <tr>
		  	<td class="int">&nbsp;</td>
			<td class="int" align="right"><input name="submit" value="Save Changes to Job" type="submit" class="normalButton" /></td>
			</tr>
			</form>
		  <form name="setJobStatus" action="setjobstatus.cfm" method="post">
		  <input type="hidden" name="jobid" value="#qryGetJobNumber.id#" />
		  <input type="hidden" name="custid" value="#url.custid#" />
		  <tr>
		  	<td>Status:</td>
			<td>
			<table width="100%">
			<tr>
			<td valign="top">
			<p>
			  <label>
			    <input type="radio" name="JobStatus" value="0" <cfif #qryGetJobNumber.Status# EQ 0>checked</cfif> />
			    Incomplete</label>
			  <br />
			  <label>
			    <input type="radio" name="JobStatus" value="1" <cfif #qryGetJobNumber.Status# EQ 1>checked</cfif>/>
			    Complete</label>
			  <br />
			  </p>			  </td>
			  <td>
			    <p>
			      <label>
			        <input type="radio" name="SubStatus" value="Pending" <cfif #qryGetJobNumber.SubStatus# EQ "Pending">checked</cfif>/>
			        Pending</label>
			      <br />
			      <label>
			        <input type="radio" name="SubStatus" value="Awarded" <cfif #qryGetJobNumber.SubStatus# EQ "Awarded">checked</cfif>/>
			        Awarded</label>
			      <br />
			      <label>
			        <input type="radio" name="SubStatus" value="Not Awarded" <cfif #qryGetJobNumber.SubStatus# EQ "Not Awarded">checked</cfif>/>
			        Not Awarded</label>
			      <br />
			      <label>
			        <input type="radio" name="SubStatus" value="In Progress" <cfif #qryGetJobNumber.SubStatus# EQ "In Progress">checked</cfif>/>
			        In Progress</label>
			      <br />
			      <label>
			        <input type="radio" name="SubStatus" value="Paid" <cfif #qryGetJobNumber.SubStatus# EQ "Paid">checked</cfif>/>
			        Paid</label>
			      <br />
			      <label>
			        <input type="radio" name="SubStatus" value="Closed" <cfif #qryGetJobNumber.SubStatus# EQ "Closed">checked</cfif> />
			        Closed</label>
			      <br />
			      </p>
			  <div align="right"><input type="submit" class="normalButton" name="submit" value="Update Job Status" /></div>			  </td>
			  </tr>
			  </table>			  </td>
			</tr>
       	  </form>
		  <script language="javascript">
		  	var dueDateCal = new calendar2(document.forms['editJob'].elements['duedate']);
			var filingDateCal = new calendar2(document.forms['editJob'].elements['filingdate']);
		  </script>
</table> 

<!---End of project home table--->
</cfoutput></td>
</tr>
<tr>
<td> 
  
  <table width="100%" border="0"  align="center">
    <tr>
      <th colspan="4"><cfoutput>Manage Project Files for #qryGetJobNumber.description# (CLS Project Number:
          <cfif #qryGetJobNumber.clsJobNumber# NEQ "">
            #qryGetJobNumber.clsJobNumber#
            <cfelse>
            No Project number assigned
          </cfif>
          )</cfoutput></th>
    </tr>
    <tr>
      <th class="subHead">File Description</th>
      <th class="subHead">File Type</th>
      <th class="subHead">Uploaded On</th>
      <th class="subHead">Actions</th>
    </tr>
    <cfoutput query="qryGetJobFiles">
      <tr>
        <td class="int"><a href="datastore/projectfiles/#filePath#">#longName#</a></td>
        <td class="int">#fileType#</td>
        <td class="int">#uploadDateTime#</td>
        <td class="int"><a href="contentmanager.cfm?action=delete&name=#filePath#&jobid=#url.jobid#&custid=#url.custid#">Delete</a></td>
      </tr>
    </cfoutput>
  </table>
  <cfif #qryGetJobFiles.RecordCount# EQ 0>
    <table width="100%" border="0" class="bodyTable" align="center">
      <tr>
        <td>No files have been added for this project.</td>
      </tr>
    </table>
  </cfif>
  <form action="uploadfileaction.cfm" 
		enctype="multipart/form-data" 
		method="post">
    <cfoutput>
      <input type="hidden" name="uploadDateTime" value="#Now()#" />
      <input type="hidden" name="projectID" value="#url.jobid#" />
      <input type="hidden" name="clientID" value="#url.custid#" />
    </cfoutput>
    <table width="100%"  border="0" class="st" align="center">
      <tr>
        <th colspan="2" height="10">Upload Project Files</th>
      </tr>
      
      
      <tr>
        <td>File Type:</td>
        <td><p>
            <label>
            <input type="radio" name="fileType" value="INVOICE" />
            Invoice</label>
            <br />
            <label>
            <input type="radio" name="fileType" value="OTHER" />
            Other</label>
            <br />
            <label>
            <input type="radio" name="fileType" value="PLAT" checked/>
            Plat</label>
            <br />
          </p></td>
      <tr>
        <td class="int">File Description:</td>
        <td class="int"><input type="text" name="longName" width="400"/></td>
      </tr>
      <tr>
        <td class="int" width="399" height="10"  align="left" valign="bottom">File:</td>
        <td class="int" width="385" align="left" valign="bottom"><input type="file" name="FiletoUpload">
		<label><input type="checkbox" name="NotifyAccounting" />Notify accounting</label>
        </td>
      </tr>
      <tr>
        <td class="int" colspan="2" align="right" valign="bottom" height="10"><input type="submit" class="normalButton" value="Upload"><br />
		
        </td>
      </tr>
	  
    </table>
  </form>
  <tr>
    <td colspan="2"></td>
  <tr>
    <td colspan="2"></td>
  </tr>
</table>

<cfoutput></cfoutput>
</td></tr></table>
</body>
</html>
