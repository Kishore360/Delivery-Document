

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~CASE' )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE case when L.dimension_wh_code='CLOSED' THEN
		CASE WHEN SRC.opened_at <= SRC.closed_at then COALESCE( TIMESTAMPDIFF(SECOND, SRC.opened_at, 
			COALESCE( SRC.closed_at,SRC.sys_updated_on)) ,'') else '' end
	  else '' end
 <> COALESCE(TRGT.open_to_close_duration ,'')