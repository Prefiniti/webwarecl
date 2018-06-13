<!-- confirm the account -->

<cfquery name="getAccountID" datasource="centerline">
	SELECT * FROM users WHERE confirm_id='#url.cid#'
</cfquery>

<cfquery name="setAccountConfirmed" datasource="centerline">
	UPDATE users.
	SET		account_enabled=1,
			confirmed=1
	WHERE	id=#getAccountID.id#
</cfquery>

<cfoutput>
	<table width="100%">
		<tr>
			<td align="center">
   
					<h3>Create Password</h3>
				
					<p>You must now set your password.</p>
          
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" id="password" /></td>
		</tr>
		<tr>
			<td>Re-Enter Password:</td>
			<td><input type="password" name="passwordConfirm" id="passwordConfirm" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" name="submit" onClick="setInitialPassword(#getAccountID.id#, GetValue('password'), GetValue('passwordConfirm'));" value="Set Password" />
			</td>
		</tr>
	</table>
</cfoutput>