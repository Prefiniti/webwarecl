<!---
	Collapse.cfm
	Expanding/Collapsing div widget
	
	John Willis
	Authored 3/9/2007

	Attributes:
		Name			The name of this box
		URL				URL of content to load inside of the box
		HeaderText		Header Text to display at the top of the box
		InitialState	Initial state of the box-"inline" or "none"
--->

<style type="text/css">

	
	.HeaderBox 
	{
	color:#000000;
	background-color: #C0C0C0;
	font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;
	font-size: small;
	padding: 3px;
	margin: 0px;
	background-image: url(/MyCL/components/tabgrad.gif);
	font-weight: normal;
	}
	.HeaderBox table
	{
		padding:0px;
		margin:0px;
	}
	
	.HeaderBox a:hover
	{
		color:#0000FF;
	}
	.HeaderBox a
	{
	color: #000000;
	text-decoration: none;
	font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
	font-weight: bold;
	}
	.cWrap
	{
	border: 1px solid #CCCCCC;
	margin: 0px;
	padding: 0px;
	}
	.ShowHideButton
	{
	font-family: "Courier New", Courier, monospace;
	font-size: x-small;
	font-weight: bold;
	}
</style>



<cfoutput>
	<div class="cWrap">
	<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td> 
				
				<div class="HeaderBox" id="#attributes.DivName#Btn" align="left" ><cfif IsDefined("attributes.SideImage")>
						<img src="/graphics/#attributes.SideImage#" align="absmiddle"/>
					</cfif>
					<a href="javascript:SwapShown('#attributes.DivName#')" style="color:white;">
						#attributes.HeaderText#
					</a>
				</div>
			
			</td>
		</tr>
		<tr>
			<td>
				<div id="#attributes.DivName#" style="display:#attributes.InitialState#">
					
					<cfinclude template="#attributes.URL#">
				</div>
			</td>
		</tr>
	</table>
	</div>


</cfoutput>