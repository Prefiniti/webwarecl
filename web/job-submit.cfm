<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>

<cfquery name="c" datasource="#session.datasource#">
	SELECT * FROM users WHERE id='#form.clientID#'
</cfquery>
	
<cfif form.latitude EQ "">
	<cfset form.latitude = 0>
</cfif>

<cfif form.longitude EQ "">
	<cfset form.longitude = 0>
</cfif>

<cfquery name="insertOrder" datasource="#session.datasource#">
	INSERT INTO projects
		(FilingType,
		CertifiedTo,
		PlatCabinetBook,
		duedate,
		section,
		specialinstructions,
		address,
		city,
		state,
		zip,
		latitude,
		longitude,
		status,
		jobtype,
		PageSlide,
		`range`,
		subdivision,
		township,
		SubdivisionOrDeed,<cfif #form.filingDate# NEQ "">
		FilingDate,</cfif>
		reqid,
		clientJobNumber,
		clientID,
		block,
		lot,
		description,
		ReceptionNumber,
		PageOrSlide,
		viewed,
		ordered_date,
		stage,
		allow_publication,
        request_photos,
        ServiceType,
        rfp)
	VALUES
		('#form.filingtype#',
		'#form.certifiedto#',
		'#form.platcabinetbook#',
		#CreateODBCDateTime(form.duedate)#,
		'#form.section#',
		'#form.specialinstructions#',
		'#form.address#',
		'#form.city#',
		'#form.state#',
		'#form.zip#',
		#form.latitude#,
		#form.longitude#,
		'#form.status#',
		'#form.jobtype#',
		'#form.pageslide#',
		'#form.range#',
		'#form.subdivision#',
		'#form.township#',
		'#form.subdivisionordeed#',
		<cfif #form.filingDate# NEQ "">
			#CreateODBCDateTime(form.filingdate)#,
		</cfif>
		'#form.reqid#',
		'#form.clientjobnumber#',
		#form.clientid#,
		'#form.block#',
		'#form.lot#',
		'#form.description#',
		'#form.receptionnumber#',
		'#form.pageorslide#',
		0,
		#CreateODBCDateTime(Now())#,
		0,
		#form.allow_publication#,
        <cfif IsDefined("form.request_photos")>
        	1,
        <cfelse>
        	0,
        </cfif>
        '#form.svctype#',
        <cfif IsDefined("form.rfp")>
        	1
        <cfelse>
        	0
        </cfif>
        )
		
</cfquery>

<!--- willisj 11/28 <cfinsert datasource="#session.datasource#" tablename="projects"> --->
<cfmail to="#session.jobreceiver#" from="donotreply@centerlineservices.biz" subject="New job order" type="html">
	<h1>New Job Order</h1>
	<p>#c.longName# has ordered a new job. Please log in to the Center Line Services web site and assign it a job number.</p>
	<p><a href="http://www.centerlineservices.biz/">Click here to view this job request.</a></p>
</cfmail>
<cfset session.message="Job request submitted.">

<cflocation url="webwareBase.cfm" addtoken="no">

</body>
</html>
