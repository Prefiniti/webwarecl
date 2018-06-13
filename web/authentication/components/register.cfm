<link href="../../centerline.css" rel="stylesheet" type="text/css">

	<h3 align="left" style="font-family: 'Times New Roman', Times, serif; color:#3399CC; font-weight:lighter; font-size:24px; margin-top:3px;">Register New MyCL Account</h3>
	<form name="regAcct">
		<table width="100%" cellspacing="0" cellpadding="3px">
			<tr>
				<th colspan="2">Name and Company</th>
			</tr>
			<tr>
				<td>Your name:</td>
				<td><input type="text" name="longName" id="longName"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><p>
				  <label>
				    <input type="radio" name="individual_account"  value="0" checked onClick="checkAcctType();">
				    I will be placing orders for my company</label>
				  <br>
				  <label>
				    <input type="radio" name="individual_account"  value="1" onClick="checkAcctType();">
				    I will be placing orders for myself</label>
				  <br>
				  </p>				</td>
			</tr>
			<tr>
			  <td>Your company:</td>
			  <td><input type="text" name="company" id="company" onkeyup="companyNameChanged();"></td>
		  </tr>
			<tr>
			  <td>Your e-mail address:</td>
			  <td>
			  	<input type="text" name="email" id="email" onkeyup="companyNameChanged();"><br />
				<label><input type="checkbox" name="email_billing" id="email_billing" checked/>I would like to be billed at this e-mail address</label>
			  </td>
		  </tr>
			<tr>
			  <td>Gender:</td>
			  <td><p>
			    <label>
			      <input type="radio" name="gender" value="M" checked>
			      Male</label>
			    <br>
			    <label>
			      <input type="radio" name="gender" value="F">
			      Female</label>
			    <br>
			    </p>			  </td>
		  </tr>
			<tr>
			  <td>Mobile phone number: </td>
			  <td><input type="text" name="smsnumber" id="smsnumber"></td>
		  </tr>
			<tr>
			  <td>Phone number:</td>
			  <td><input type="text" name="phone" id="phone" /></td>
		  </tr>
			<tr>
			  <td>Fax number:</td>
			  <td><input type="text" name="fax" id="fax" /></td>
		  </tr>
			<tr>
				<th colspan="2">Addresses</th>
			</tr>
			<tr>
			<td>Physical Address:</td>
			<td>
				<table>
					<tr>
						<td>Street:</td>
						<td><input type="text" name="mailing_address" id="mailing_address" ></td>
					</tr>
					<tr>
						<td>City:</td>
						<td><input type="text" name="mailing_city" id="mailing_city" ></td>
					</tr>
					<tr>
						<td>State:</td>
						<td><input type="text" name="mailing_state" id="mailing_state" ></td>
					</tr>
					<tr>
						<td>ZIP Code:</td>
						<td><input type="text" name="mailing_zip" id="mailing_zip" ></td>
					</tr>
				</table>			</td>
		</tr>
				<tr>
			<td>Billing Address:</td>
			<td>&nbsp;
				
				<label>
				<input type="checkbox" name="chkCopyAddress" id="chkCopyAddress" value="checkbox" onclick="copyAddress();">
				My billing address is the same as my physical address</label>
				<table>
					<tr>
						<td>Street:</td>
						<td><input type="text" name="billing_address" id="billing_address" ></td>
					</tr>
					<tr>
						<td>City:</td>
						<td><input type="text" name="billing_city" id="billing_city" ></td>
					</tr>
					<tr>
						<td>State:</td>
						<td><input type="text" name="billing_state" id="billing_state" ></td>
					</tr>
					<tr>
						<td>ZIP Code:</td>
						<td><input type="text" name="billing_zip" id="billing_zip" ></td>
					</tr>
				</table>			</td>
		</tr>
				<tr>
				  <th colspan="2">Login Information</th>
				 </tr>
				 <tr>
				 	<td>Login Name:</td>
					<td>
						<input type="text" name="username" id="username"/>
						<input type="button" name="checkAvailabilityx" id="checkAvailabilityx" class="normalButton" onClick="checkAvailability(GetValue('username'));" value="Check Availability" />
						<span id="availability"></span>					
					</td>
				 </tr>
				<tr>
					<td colspan="2" align="right">
					<!--function registerAccount(longName, individual_account, company, email, email_billing, gender, 
						smsnumber, phone, fax,
						 mailing_address, mailing_city, mailing_state, mailing_zip,
						 billing_address, billing_city, billing_state, billing_zip, username, availability)-->
						<input type="button" name="submit" class="normalButton" value="Create Account" onclick="registerAccount(GetValue('longName'), AjaxGetCheckedValue('individual_account'), GetValue('company'), GetValue('email'), IsChecked('email_billing'), AjaxGetCheckedValue('gender'), GetValue('smsnumber'), GetValue('phone'), GetValue('fax'), GetValue('mailing_address'), GetValue('mailing_city'), GetValue('mailing_state'), GetValue('mailing_zip'), GetValue('billing_address'), GetValue('billing_city'), GetValue('billing_state'), GetValue('billing_zip'), GetValue('username'), GetInnerHTML('availability'));"/>
					</td>
				</tr>
		  
		</table>
	</form>
