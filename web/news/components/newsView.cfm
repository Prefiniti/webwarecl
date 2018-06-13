<cfquery name="gNews" datasource="centerline">
	SELECT * FROM news_items ORDER BY date DESC
</cfquery>

<cfquery name="pCount" datasource="centerline">
	SELECT id FROM projects
</cfquery>

<p>WebWare is tracking <strong><cfoutput>#pCount.RecordCount#</cfoutput> projects</strong> for <strong>Center Line Services</strong> in our database.</p>

<cfoutput query="gNews" maxrows="5">
	<table width="100%">
	<tr>
		<td style="text-transform:capitalize; margin-bottom:0px;"><strong>
	  <img src="/graphics/newspaper.png" align="absmiddle"> #headline#</strong></td><td align="right" >#DateFormat(date, "mm/dd/yyyy")#</td>
	</tr>
	<tr>
	<td colspan="2" align="left" style="color:blue; padding-left:30px">#body#</td>
	</tr>
	<tr>
	<td colspan="2" align="right" style="border-bottom:1px solid silver; font-size:xx-small;">
		<img src="/graphics/zoom.png" align="absmiddle"> <a href="/news/getArticle.cfm?id=#id#" target="_blank">View Full Article</a>
	</td>
	</tr>
  </table>
</cfoutput>