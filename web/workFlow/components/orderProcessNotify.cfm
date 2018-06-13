
<cfquery name="c" datasource="centerline">
	SELECT * FROM users WHERE id='#attributes.clientID#'
</cfquery>

<cfquery name="gProj" datasource="centerline">
	SELECT * FROM projects WHERE id=#attributes.id#
</cfquery>



<cfoutput>
<cfmail to="#c.email#" from="donotreply@centerlineservices.biz" subject="Center Line Services Order Processing" type="html">
	

<html>
<head>

<style type="text/css">
<!--
	h1 {
		font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;
	}
	.orderProc {
		font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;
		color: silver;
		letter-spacing:6px;
		font-size:large;
	}
	.orderListBlock {
	height: auto;
	margin-top: 20px;
	border: 1px solid ##999999;
	margin-right: 20px;
	width: 600px;
	float: right;
	display: inline;
	margin-bottom: 20px;


	border-radius: 5px;
	padding:5px;
	clear:right;
	overflow: visible;
}
.sidebarBlock {
	float: left;
	width: 240px;
	height: 100px;
	margin-top: 20px;
	margin-left: 5px;
	margin-right: 0px;
	border: 1px solid ##999999;
	margin-bottom: 20px;
	
	border-radius: 5px;
}
body, td {
	font-family: "lucida grande", Tahoma, Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	color:##666666;
	
	background-color:##FFFFFF;
}
th {
	font-family: "lucida grande", Tahoma, Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
	background-color: ##3399CC;
	color: ##FFFFFF;
	background-image: url(http://www.centerlineservices.biz/MyCL/components/tabgrad.gif);
	padding: 3px;
}
.VPLink {
	font-family: "Trebuchet MS", Verdana;
	font-weight: bold;
	border: 1px solid ##999999;
	width: 200px;
	background-color: ##CCCCCC;
	text-align: center;
	color: ##0099FF;
	padding: 4px;
	margin: 30px;
}
-->
</style>

</head>
<body>
	<div style="border:1px solid silver; width:900px;">
	<table width="100%" cellspacing="0">
		<tr>
			<td><img src="http://www.centerlineservices.biz/graphics/mycl.gif"></td>
		    <td valign="top" align="right" class="orderProc">ORDER PROCESSING</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="sidebarBlock" style="height:auto" align="center">
					<table width="100%">
						<tr>
							<th>Order Summary</th>
						</tr>
						<tr>
							<td>
								<strong>Client:</strong> <cfmodule template="/jobViews/components/companyByClientID.cfm" id="#gProj.clientID#"><br>
							<strong>Ordered By:</strong> <cfmodule template="/jobViews/components/custNameByID.cfm" id="#gProj.clientID#"><br>
							<strong>Order Date:</strong> #gProj.ordered_date#<br>
							<strong>Project Type:</strong> #gProj.jobtype#<br>
							<strong>Location:</strong> #gProj.address#, #gProj.city#, #gProj.state#  #gProj.zip#<br>
							<strong>Subdivision:</strong> #gProj.subdivision#<br>
							<strong>Legal Description:</strong> Section #gProj.section#, #gProj.township#, #gProj.range#
							</td>
						</tr>
					</table>
					
				</div>
				<div class="orderListBlock" style="text-align:center" align="center">
					<cfswitch expression="#gProj.stage#">
						<cfcase value="0">
							<h1 style="font-size:x-large">Order Reversed</h1>
							<p>#gProj.reverse_explanation#</p>
							<div align="center" class="VPLink"><img src="http://www.centerlineservices.biz/graphics/zoom.png" align="absmiddle"> <a href="http://www.centerlineservices.biz/projectView.cfm?id=#attributes.id#">View Project</a></div><br>&nbsp;
						</cfcase>
						<cfcase value="1">
							<h1 style="font-size:x-large">Your order has been processed.</h1>
							
							<div align="center" class="VPLink"><img src="http://www.centerlineservices.biz/graphics/zoom.png" align="absmiddle"> <a href="http://www.centerlineservices.biz/projectView.cfm?id=#attributes.id#">View Project</a></div><br>&nbsp;
						</cfcase>
					</cfswitch>
				</div>
			</td>
		</tr>
	</table>
	</div>

	<p></p>
</body>
</cfmail>
</cfoutput>
