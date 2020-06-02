
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.closed_on' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN #DWH_TABLE_SCHEMA.f_change_request TRGTF
 ON (TRGT.row_id=TRGTF.row_id 
 AND TRGT.source_id=TRGTF.source_id )
 
JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on(LM.dimension_code=TRGTF.state_src_code
 AND LM.dimension_class='STATE~CHANGE_REQUEST')
 

WHERE CASE WHEN LM.dimension_wh_code='CLOSED' THEN 
COALESCE( convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on) ,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') ,'')
ELSE '' END <> COALESCE(TRGT.closed_on ,'')
