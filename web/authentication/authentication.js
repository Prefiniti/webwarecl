var refreshTimer;

function editUser(id)
{
	var url;
	url = '/authentication/components/editUser.cfm?id=' + escape(id);
	url += '&isAdmin=' + escape(glob_isAdmin);
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function changeAccountInfo(id)
{
	var url;
	url = '/authentication/components/editAccount.cfm?id=' + escape(id);
	url += '&isAdmin=' + escape(glob_isAdmin);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function changeAccountType(id)
{
	var url;
	url = '/authentication/components/changeAccountType.cfm?id=' + escape(id);
	url += '&isAdmin=' + escape(glob_isAdmin);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function changePassword(id)
{
	var url;
	url = "/authentication/components/changePassword.cfm?id=" + escape(id);
	url += '&isAdmin=' + escape(glob_isAdmin);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function addCompany()
{
	var url;
	if (!glob_isAdmin) {
		AjaxLoadAuthenticationErrorPage();
	}
	else {
		url = '/authentication/components/addCompany.cfm';
	
		AjaxLoadPageToDiv('tcTarget', url);
	}
}

function addUser()
{
	var url;
	if (!glob_isAdmin) {
		AjaxLoadAuthenticationErrorPage();
	}
	else {
		url = '/authentication/components/addAccount.cfm';
	
	
		AjaxLoadPageToDiv('tcTarget', url);
	}
}

function createAccount(username, longName, email)
{
	var url;
	url = '/authentication/components/addAccountSubmit.cfm?p_username=' + escape(username);
	url += '&longName=' + escape(longName);
	url += '&email=' + escape(email);
	
	AjaxLoadPageToDiv('tcTarget', url);
}

function editCompany(id)
{
	var url;
	if (!glob_isAdmin) {
		AjaxLoadAuthenticationErrorPage();
	}
	else {
		url="/authentication/components/editCompany.cfm?id=" + escape(id);
	
		AjaxLoadPageToDiv('tcTarget', url);
	}
}


function updateAccountInfo(id, company, longName, email, smsNumber, gender, bio, title, phone, fax, remember_page)
{
	
	var url;
	url = "/authentication/components/editAccountSubmit.cfm?id=" + escape(id);
	url += "&company=" + escape(company);
	url += "&longName=" + escape(longName);
	url += "&email=" + escape(email);
	url += "&smsNumber=" + escape(smsNumber);
	url += "&gender=" + escape(gender);
	url += "&bio=" + escape(bio);
	url += "&title=" + escape(title);
	url += "&phone=" + escape(phone);
	url += "&fax=" + escape(fax);
	url += "&remember_page=" + escape(remember_page);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

//updateAccountType(#url.id#, AjaxGetCheckedValue('type'), GetValue('orderRep'), GetValue('admin'), GetValue('tcAdmin'))

function updateAccountType(id, type, orderRep, admin, tcAdmin, account_enabled, order_processor, site_maintainer, receives_timesheet_reminders)
{
	var url;
	var roleStr;
	var adminStr;
	var enabledStr;
	var opStr;
	var smStr;
	var trStr;
	
	url = "/authentication/components/accountTypeSubmit.cfm?id=" + escape(id);
	url += "&type=" + escape(type);
	
	if (orderRep == true) {
		roleStr = escape("ORDER REP");	
	}
	
	if (admin == true) {
		roleStr = escape("ADMIN");
	}
	
	url += "&role=" + roleStr;
	
	if (tcAdmin == true) {
		adminStr = "yes";
	}
	else {
		adminStr = "no";
	}
	
	url += "&tcadmin=" + escape(adminStr);
	
	if (account_enabled == true) {
		enabledStr = "1";
	}
	else {
		enabledStr = "0";
	}
	
	url += "&account_enabled=" + escape(enabledStr);
	
	if (order_processor == true) {
		opStr = "1";
	}
	else {
		opStr = "0";
	}
	
	url += "&order_processor=" + escape(opStr);
	
	if (site_maintainer == true) {
		smStr = "1";
	}
	else {
		smStr = "0";
	}
	
	url += "&site_maintainer=" + escape(smStr);
	
	if (receives_timesheet_reminders == true) {
		trStr = "1";
	}
	else {
		trStr = "0";
	}
	
	url += "&receives_timesheet_reminders=" + escape(trStr);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function updateCompany(id, name, mailing_address, mailing_city, mailing_state,
					   mailing_zip, billing_address, billing_city, billing_state,
					   billing_zip, website)
{
	var url;
	url = '/authentication/components/editCompanySubmit.cfm?id=' + escape(id);
	url += '&name=' + escape(name);
	url += '&mailing_address=' + escape(mailing_address);
	url += '&mailing_city=' + escape(mailing_city);
	url += '&mailing_state=' + escape(mailing_state);
	url += '&mailing_zip=' + escape(mailing_zip);
	url += '&billing_address=' + escape(billing_address);
	url += '&billing_city=' + escape(billing_city);
	url += '&billing_state=' + escape(billing_state);
	url += '&billing_zip=' + escape(billing_zip);
	url += '&website=' + escape(website);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function createCompany(name, mailing_address, mailing_city, mailing_state,
					   mailing_zip, billing_address, billing_city, billing_state,
					   billing_zip, website)
{
	var url;
	url = '/authentication/components/addCompanySubmit.cfm';
	url += '?name=' + escape(name);
	url += '&mailing_address=' + escape(mailing_address);
	url += '&mailing_city=' + escape(mailing_city);
	url += '&mailing_state=' + escape(mailing_state);
	url += '&mailing_zip=' + escape(mailing_zip);
	url += '&billing_address=' + escape(billing_address);
	url += '&billing_city=' + escape(billing_city);
	url += '&billing_state=' + escape(billing_state);
	url += '&billing_zip=' + escape(billing_zip);
	url += '&website=' + escape(website);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function checkAcctType()
{
	var curVal;
	curVal = AjaxGetCheckedValue('individual_account');
	
	if (curVal == 1) {
		SetValue('company', GetValue('longName'));
	}
	else {
		SetValue('company', '');
	}
	
	return;
}

function copyAddress()
{
	if (IsChecked('chkCopyAddress')) {
		SetValue('billing_address', GetValue('mailing_address'));
		SetValue('billing_city', GetValue('mailing_city'));
		SetValue('billing_state', GetValue('mailing_state'));
		SetValue('billing_zip', GetValue('mailing_zip'));
	}
	else {
		SetValue('billing_address', '');
		SetValue('billing_city', '');
		SetValue('billing_state', '');
		SetValue('billing_zip', '');		
	}
}

function companyNameChanged()
{
	
	SetRadioCheckedValue('individual_account', '0');
}

function checkAvailability(username)
{
	var url;
	url = "/authentication/components/checkAvailability.cfm?username=" + escape(username);
	
	AjaxLoadPageToDiv('availability', url);
}

function registerAccount(longName, individual_account, company, email, email_billing, gender, smsnumber, phone, fax,
						 mailing_address, mailing_city, mailing_state, mailing_zip,
						 billing_address, billing_city, billing_state, billing_zip, username, availability)
{
	// form validation
	if (longName == "") {
		showMessage('Registration Error', 'You must enter your name');
		return;
	}
	
	if (company == "") {
		showMessage('Registration Error', 'You must enter your company');
		return;
	}
	
	if (email == "") {
		showMessage('Registration Error', 'You must enter your e-mail address');
		return;
	}
	
	if (phone == "") {
		showMessage('Registration Error', 'You must enter your phone number');
		return;
	}
	
	if (mailing_address == "") {
		showMessage('Registration Error', 'You must enter your physical address');
		return;
	}
	
	if (mailing_city == "") {
		showMessage('Registration Error', 'You must enter your physical address');
		return;
	}
	
	if (mailing_state == "") {
		showMessage('Registration Error', 'You must enter your physical address');
		return;
	}
	
	if (mailing_zip == "") {
		showMessage('Registration Error', 'You must enter your physical address');
		return;
	}
	
	if (billing_address == "") {
		showMessage('Registration Error', 'You must enter your billing address');
		return;
	}
	
	if (billing_city == "") {
		showMessage('Registration Error', 'You must enter your billing address');
		return;
	}
	
	if (billing_state == "") {
		showMessage('Registration Error', 'You must enter your billing address');
		return;
	}
	
	if (billing_zip == "") {
		showMessage('Registration Error', 'You must enter your billing address');
		return;
	}
	
	if (username == "") {
		showMessage('Registration Error', 'You must choose a login name');
	}
	
	if (availability == "<span style=\"color: red;\">This login name is already in use. Please choose another.</span>") {
		showMessage('Registration Error', 'The login name you have chosen is in use.');
		return;
	}
	
	if (availability == "") {
		showMessage('Registration Error', 'You have not validated your username.');
		return;
	}
	// end of form validation
	
	/*longName, individual_account, company, email, email_billing, gender, smsnumber, phone, fax,
						 mailing_address, mailing_city, mailing_state, mailing_zip,
						 billing_address, billing_city, billing_state, billing_zip, username, availability*/
	
	// build submission URL
	var url;
	url = "/authentication/components/registerSubmit.cfm?longName=" + escape(longName);
	url += "&individual_account=" + escape(individual_account);
	url += "&company=" + escape(company);
	url += "&email=" + escape(email);
	url += "&email_billing=" + escape(email_billing);
	url += "&gender=" + escape(gender);
	url += "&smsnumber=" + escape(smsnumber);
	url += "&phone=" + escape(phone);
	url += "&fax=" + escape(fax);
	url += "&mailing_address=" + escape(mailing_address);
	url += "&mailing_city=" + escape(mailing_city);
	url += "&mailing_state=" + escape(mailing_state);
	url += "&mailing_zip=" + escape(mailing_zip);
	url += "&billing_address=" + escape(billing_address);
	url += "&billing_city=" + escape(billing_city);
	url += "&billing_state=" + escape(billing_state);
	url += "&billing_zip=" + escape(billing_zip);
	url += "&reg_username=" + escape(username);
	

	
	
	AjaxLoadPageToDiv('tcTarget', url);
	

}

function setPassword(id, pw, pwConfirm)
{
	
	if (pw != pwConfirm) {
		showMessage('Authentication Error', 'The passwords you entered do not match.');
		return;
	}
	
	var url;
	url = "/authentication/components/setPasswordSubmit.cfm?id=" + escape(id);
	url += "&password=" + escape(pw);
	
	
	AjaxLoadPageToDiv('userActionTarget', url);
	
}

function setInitialPassword(id, pw, pwConfirm)
{
	
	if (pw != pwConfirm) {
		showMessage('Authentication Error', 'The passwords you entered do not match.');
		return;
	}
	
	var url;
	url = "/authentication/components/setInitialPasswordSubmit.cfm?id=" + escape(id);
	url += "&password=" + escape(pw);
	
	
	AjaxLoadPageToDiv('tcTarget', url);
	
}

function getWebWareLogin()
{
	window.open("/default.cfm","_blank","width=1000,height=800,toolbar=0,menubar=0,scrollbars=1"); 
}

function changePicture(id)
{
	var url;
	url = "/authentication/components/changePicture.cfm?id=" + escape(id);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}
	
function doPictureUpload(id)
{
	SetInnerHTML('changePictureLink', '<p style="color:red">Upload in progress...</p>');
	window.open("","uploadStatusWindow","width=420,height=220,toolbar=0"); 
    var a = window.setTimeout("document.uploadPicture.submit();",500);
	
	refreshTimer = window.setTimeout("refreshProfile(" + id + ", true);", 3500);
}

function refreshProfile(id, enabled)
{
	if (enabled == true)
	{
		editUser(id);
		refreshTimer = null;
	}

}
		
function setMaintenance(maint)
{
	var url;
	var mStr;
	
	if (maint == true) {
		mStr = "1";
	}
	else {
		mStr = "0";
	}
	
	url = "/authentication/components/setMaintenance.cfm?maintenance=" + escape(mStr);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function setLoginsDisabled(ld)
{
	var url;
	var mStr;
	
	if (ld == true) {
		mStr = "1";
	}
	else {
		mStr = "0";
	}
	
	url = "/authentication/components/setLoginsDisabled.cfm?logins_disabled=" + escape(mStr);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function loadMaintenancePanel()
{
	AjaxLoadPageToDiv('tcTarget', '/authentication/components/maintenancePanel.cfm');
}

function confirmSMS(userid, number)
{
	var url;
	url = "/authentication/components/confirmSMS.cfm?userid=" + escape(userid);
	url += "&number=" + escape(number);
	
	AjaxLoadPageToDiv('userActionTarget', url);
}

function viewProfile(userid)
{
	var url;
	url = "/authentication/components/viewProfile.cfm?userid=" + escape(userid);
	
	AjaxLoadPageToDiv('tcTarget', url);
}