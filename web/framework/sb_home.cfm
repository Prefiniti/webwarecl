<table width="100%">
						
						<tr>
							<td>
							
								
							
							<cfif #url.permissionLevel# EQ 0>
								<cfmodule template="/MyCL/components/Collapse.cfm" DivName="searchBar" HeaderText="Project Locator" InitialState="none" URL="/search/components/search.cfm" SideImage="zoom.png">
							<cfelse>
								<cfmodule template="/MyCL/components/Collapse.cfm" DivName="searchBar" HeaderText="Project Locator" InitialState="none" URL="/search/components/search.cfm" SideImage="zoom.png">
							</cfif>
							
							<cfmodule template="/MyCL/components/Collapse.cfm" URL="/netsearch/components/netsearchBox.cfm" SideImage="zoom.png" HeaderText="Internet Search" InitialState="none" DivName="NetSearchBar">
							<cfif #url.permissionLevel# EQ 1>
							<cfmodule template="/MyCL/components/Collapse.cfm" DivName="timeEntryBar" HeaderText="Time Entry" InitialState="none" URL="/framework/sb_TimeEntry.cfm" SideImage="time_go.png">	
							</cfif>
							
							</td>
						</tr>
						<tr>
							<td>
							<div class="OptionsBox">
		  						<div class="OptionBoxHeading">Options</div>
									<label class="SettingsCheckBox"><input type="checkbox" name="KeepTabsOpen" id="KeepTabsOpen" align="absmiddle"/> Keep sidebars open until I close them</label>
							</div>
							</td>
						</tr>
					</table>