<cffile action="upload"
		destination="/var/www/webwarecl.prefiniti.com/authentication/profile_images"
		nameConflict="makeunique"
		fileField="Form.FiletoUpload">


<cfquery name="updatePicture" datasource="centerline">
	UPDATE users
	SET		picture='#cffile.serverfile#'
	WHERE	id=#form.userid#
</cfquery>
<link href="../../centerline.css" rel="stylesheet" type="text/css">


<table width="100%">
	<tr>
		<td align="center">
			<h3>Picture Uploaded</h3>
			
			<p class="VPLink"><img src="/graphics/delete.png" border="0" align="absmiddle"> <a href="javascript:window.close();">Close</a>
			</p>
		</td>
	</tr>
</table>

<script language="javascript">
	window.close();
</script>