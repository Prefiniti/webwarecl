<!--function updateFilingInfo(statusDiv, project_id, SubdivisionOrDeed, FilingType, PlatCabinetBook,
						  PageOrSlide, PageSlide, ReceptionNumber, FilingDate, CertifiedTo)-->
<cfquery name="oiUpdate" datasource="centerline">
	UPDATE projects
	SET		specialinstructions='#url.specialinstructions#'
	WHERE	id=#url.id#
</cfquery>
Changes saved.