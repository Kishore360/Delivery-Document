

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.request_state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'REQUEST_STATE~SC_REQUEST' )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(COALESCE( SRC.closed_at,SRC.sys_updated_on),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') 
	and LKP.source_id=0)
WHERE CASE WHEN L.dimension_wh_code='CLOSED' THEN COALESCE(LKP.row_key,'')
	WHEN L.dimension_wh_code='CANCELED' THEN '' ELSE 0 END 
<> COALESCE(TRGT.closed_on_key,'')
