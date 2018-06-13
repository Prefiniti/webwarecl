					<cfquery name="gInbox" datasource="centerline">
					SELECT messageInbox.id AS msgid, messageInbox.tbody, messageInbox.tsubject, messageInbox.tdate, messageInbox.tread, users.username FROM messageInbox INNER JOIN users ON users.id=messageInbox.fromuser WHERE messageInbox.touser=#session.userid# AND messageInbox.tread='no' ORDER BY messageInbox.tdate
					</cfquery>
					<table width="100%">
                      <cfif #session.unread# GT 0>
                        <tr>
                          <td style="text-indent:30px;"><img align="absmiddle" src="graphics/email.png"/> You have <a href="javascript:viewMailFolder('inbox');" style="color:red"><strong><cfoutput>#session.unread#</cfoutput> unread messages</strong></a> in your inbox. <br />
                              <div style="padding-left:40px;">
                              <table width="100%" cellspacing="0">
                                <cfoutput query="gInbox">
                                  <tr>
                                    <td style="background-color:##CCCCCC"><a href="javascript:showDiv('body_#msgid#')"><img src="graphics/email_open.png" border="0" /></a></td>
                                    <td style="background-color:##CCCCCC"><cfif #tread# EQ "no">
                                    </cfif>
                                        <strong>#username#</strong></td>
                                    <td style="background-color:##CCCCCC">#DateFormat(tdate, "mm/dd/yyyy")#</td>
                                    <td style="background-color:##CCCCCC">#tsubject#</td>
                                  </tr>
                                  <tr>
                                    <td colspan="4" style="background-color:##CCCCCC">
										<div id="body_#msgid#" style="display:none;"> #tbody# </div>
									</td>
                                  </tr>
                                  </div>
                                  
                                </cfoutput>
                              </table>
                            </div>
                          </td>
                        </tr>
                      </cfif>
                      <cfif #session.overdue# GT 0>
                        <tr>
                          <td style="text-indent:30px;"><img align="absmiddle" src="graphics/clock_error.png"/> There are <a href="checkOverdue.cfm" style="color:red"><strong><cfoutput>#session.overdue#</cfoutput> delinquent orders </strong></a> in the system.</td>
                        </tr>
                      </cfif>
                      <cfif #session.tcadmin# EQ "yes">
                        <cfif #session.tcsigned# GT 0>
                          <tr>
                            <td style="text-indent:30px;"><img align="absmiddle" src="graphics/time.png"/> There are <cfoutput><a href="javascript:loadTimesheetView('tcTarget', 'noUserFilter', '1/1/1980', '1/1/2999', 'Signed', '#session.tcadmin#', '')" style="color:red"><strong>#session.tcsigned# timesheets</strong></a></cfoutput> awaiting your approval.</td>
                          </tr>
                        </cfif>
                      </cfif>
                      <cfif #session.tcopen# GT 0>
                        <tr>
                          <td style="text-indent:30px;"><img align="absmiddle" src="graphics/time.png"/> You have <cfoutput><a href="javascript:loadTimesheetView('tcTarget', #session.userid#, '1/1/1980', '1/1/2999', 'Open', '#session.tcadmin#', '')" style="color:red"><strong>#session.tcopen# open timesheets</strong></a></cfoutput> which need to be signed.</td>
                        </tr>
                      </cfif>
                      <cfif #session.order_processor# EQ 1>
					  <cfif #session.newJobs# GT 0>
                        <tr>
                          <td style="text-indent:30px;"><img align="absmiddle" src="graphics/basket.png"/> There are <cfoutput><a href="javascript:AjaxLoadPageToDiv('tcTarget', 'jobViews/newJobs.cfm');" style="color:red"><strong>#session.newJobs# new Job Requests</strong></a></cfoutput> in the system. </td>
                        </tr>
                      </cfif>
					  </cfif>
                    </table>
					