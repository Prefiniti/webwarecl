<cfquery name="profile" datasource="centerline">
	SELECT * FROM users WHERE id=#url.userid#
</cfquery>

<cfquery name="gpCount" datasource="centerline">
	SELECT id FROM projects WHERE clientID=#url.userid#
</cfquery>

<cfoutput query="profile">
						<table width="100%">
							<tr>
								<td rowspan="2" align="left" valign="top" width="150">
									<cfif #picture# EQ "">
										<img src="/graphics/no_pic.gif" width="150" height="150">
									<cfelse>
										<img src="/authentication/profile_images/#picture#" width="150" height="150">
									</cfif><br>
													<cfswitch expression="#online#">
					<cfcase value="0"><font color="red">User is offline</font></cfcase>
					<cfcase value="1"><font color="green">User is online</font></cfcase>
				</cfswitch>
								</td>
								<td valign="top" align="right" style="background-color:##CCCCCC"><h3 align="right" style="font-family: 'Times New Roman', Times, serif; color:##3399CC; font-weight:lighter; font-size:24px; margin-top:3px; margin-bottom:0px; padding-botton:2px;">#longName#</h3><a href="javascript:mailTo(#id#, '#longName#');">Send Message</a><cfif #smsnumber# NEQ "">
				&nbsp;| <a href="javascript:showDiv('sendText_#id#');">Send Text Message</a>
				
				<div id="sendText_#id#" style="display:none;">
					<br>
					<label>Message Body: <input type="text" name="text_#id#" id="text_#id#" maxlength="160"></label><br>
					<input type="button" class="normalButton" name="sendMsg_#id#" id="sendMsg_#id#" value="Send Text Message" onclick="sendText('#id#', GetValue('text_#id#'));">
				</div>
				</cfif> | <a href="javascript:showDiv('sendIMd');">Send Instant Message</a>
				
				<div id="sendIMd" style="display:none;">
					<br>
					<label>Message Body: <input type="text" name="im" id="im" maxlength="160"></label><br>
					<input type="button" class="normalButton" name="sendIM" id="sendIM" value="Send Instant Message" onclick="sendIM('#id#', GetValue('im'));">
				</div>
				</td>
							</tr>
							<tr>
							  <td valign="top" style="padding:30px;">
							  
							  <p>This user has placed <strong>#gpCount.RecordCount#</strong> orders using WebWare.CL</p>
							  
						
							 <p style="border:1px solid silver; padding:10px;">
							 <span style="font-weight:bold;">About Me</span><br>
							 	#bio#
							 </p>
							  		
							  	

							  </td>
						  </tr>
						</table>
					</cfoutput>
				