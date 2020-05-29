SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.change_request_status=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~CHANGE_REQUEST' )
 LEFT JOIN  #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE case when L.dimension_wh_code='CLOSED' THEN
		CASE WHEN SRC.submit_date <= COALESCE( SRC.closed_date,SRC.last_modified_date) then COALESCE( TIMESTAMPDIFF(SECOND, SRC.submit_date, 
			COALESCE( SRC.closed_date,SRC.last_modified_date)) ,'') else '' end
	  else '' end
<> COALESCE(TRGT.open_to_close_duration ,'')