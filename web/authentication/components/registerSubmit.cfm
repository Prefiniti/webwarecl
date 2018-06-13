<!--create the company-->

<cfparam name="cid" default="#CreateUUID()#">

<cfquery name="createCompany" datasource="centerline">
	INSERT INTO companies 
		(name,
		mailing_address,
		mailing_city,
		mailing_state,
		mailing_zip,
		billing_address,
		billing_city,
		billing_state,
		billing_zip,
		confirm_id)
	VALUES ('#url.company#',
		'#url.mailing_address#',
		'#url.mailing_city#',
		'#url.mailing_state#',
		'#url.mailing_zip#',
		'#url.billing_address#',
		'#url.billing_city#',
		'#url.billing_state#',
		'#url.billing_zip#',
		'#cid#')
</cfquery>

<!-- retrieve the company id for the new company -->

<cfquery name="getCompanyID" datasource="centerline">
	SELECT id FROM companies WHERE confirm_id='#cid#'
</cfquery>

<!-- create the user account -->
<cfquery name="createUserAccount" datasource="centerline">
	INSERT INTO users 
		(longName,
		individual_account,
		company,
		email,
		email_billing,
		gender,
		smsnumber,
		phone,
		fax,
		username,
		confirm_id,
		confirmed,
		account_enabled,
		type,
        last_pwchange)
	VALUES ('#url.longName#',
		#url.individual_account#,
		#getCompanyID.id#,
		'#url.email#',
		<cfif #url.email_billing# EQ true>
		1,
		<cfelse>
		0,
		</cfif>
		'#url.gender#',
		'#url.smsnumber#',
		'#url.phone#',
		'#url.fax#',
		'#url.reg_username#',
		'#cid#',
		0,
		0,
		0,
        #CreateODBCDateTime(Now())#)
</cfquery>

<cfoutput>
<cfmail from="register@centerlineservices.biz" to="#url.email#" cc="accountnotify@centerlineservices.biz" subject="Center Line Services Account Confirmation" type="html">
	<h1>Account Created</h1>
	
	<p>Your Center Line Services account has been created. Please visit the link below to confirm your new account.</p>
	
	<a href="http://www.centerlineservices.biz/appBase.cfm?sideBar=Register&contentBar=/authentication/components/setInitialPassword.cfm?cid=#cid#">Confirm My Account</a>
	
	<p>Otherwise, copy the following text to your browser's URL bar:</p>
	
	<pre>http://www.centerlineservices.biz/appBase.cfm?sideBar=Register&contentBar=/authentication/components/setInitialPassword.cfm?cid=#cid#</pre>
</cfmail>
</cfoutput>

<cfoutput>
<table width="100%">
<tr>
	<td align="center">
		<h3>Account Created.</h3>
		
		<p>An e-mail containing instructions for activating your account has been sent to <strong>#url.email#</strong>.</p>
		
	</td>
</tr>
</table>
</cfoutput>
