<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
		<cfmail to="contact@centerlineservices.biz;anthony@centerlineservices.biz" from="#form.email#" subject="Center Line Services Website Query - #form.subject#" type="html">
			<h1>Center Line Services</h1>
			<h2>Web Site Query</h2>
			
			<p>You have received the following e-mail from <strong>#form.yourname#</strong>:</p>
			
			<p>#form.body#</p>
		</cfmail>
		
		<cflocation url="default.cfm" addtoken="no">
</body>
</html>
