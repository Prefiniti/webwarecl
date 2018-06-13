<cfsetting enablecfoutputonly="yes">
<cfquery name="gNews" datasource="centerline">
	SELECT * FROM news_items ORDER BY date DESC
</cfquery>

<cfoutput><?xml version="1.0"?>
<rss version="2.0">
	<channel>
		<title>Center Line Services News</title>
		<link>http://www.centerlineservices.biz/news/rss.cfm</link>
		<description>Center Line Services News</description>
		<language>en-us</language>
		<pubDate>#DateFormat(now(), "ddd, dd mmm yyyy")# #TimeFormat(now(), "HH:mm:ss")# MST</pubDate>
		<lastBuildDate>#DateFormat(now(), "ddd, dd mmm yyyy")# #TimeFormat(now(), "HH:mm:ss")# MST</lastBuildDate>
</cfoutput>
<cfoutput query="gNews">
<item>
	<title>#XmlFormat(headline)#</title>
	<description>#XmlFormat(body)#</description>
	<link>http://www.centerlineservices.biz/news/getArticle.cfm?id=#id#</link>
	<pubDate>#DateFormat(date, "ddd, dd mmm yyyy")# #TimeFormat(date, "HH:mm:ss")# MST</pubDate>
</item>
</cfoutput>
<cfoutput>
</channel>
</rss>
</cfoutput>