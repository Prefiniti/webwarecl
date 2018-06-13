<cfswitch expression="#url.step#">
	<cfcase value="2">
		<cfquery name="writeStep" datasource="centerline">
			UPDATE projects SET description='#url.description#' WHERE id=#url.id#
		</cfquery>	
	</cfcase>
	<cfcase value="3">
		<cfquery name="writeStep" datasource="centerline">
		
		</cfquery>	
	</cfcase>
	<cfcase value="4">
		<cfquery name="writeStep" datasource="centerline">
		
		</cfquery>	
	</cfcase>
	<cfcase value="5">
		<cfquery name="writeStep" datasource="centerline">
		
		</cfquery>	
	</cfcase>
	<cfcase value="6">
		<cfquery name="writeStep" datasource="centerline">
		
		</cfquery>	
	</cfcase>
	<cfcase value="7">
		<cfquery name="writeStep" datasource="centerline">
		
		</cfquery>	
	</cfcase>		
	<cfcase value="8">
		<cfquery name="writeStep" datasource="centerline">
		
		</cfquery>	
	</cfcase>
</cfswitch>
