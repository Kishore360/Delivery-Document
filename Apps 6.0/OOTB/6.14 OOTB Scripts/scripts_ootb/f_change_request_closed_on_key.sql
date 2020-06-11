
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_on_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on(LM.dimension_code=TRGT.state_src_code
 AND LM.dimension_class='STATE~CHANGE_REQUEST')
 

LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)
 WHERE CASE WHEN LM.dimension_wh_code='CLOSED' THEN
 COALESCE(LKP.row_key,CASE WHEN coalesce(SRC.closed_at,SRC.sys_updated_on) IS NULL THEN '' else '' end) 
  WHEN LM.dimension_wh_code='CANCELED' THEN ''
 ELSE 0 END 
<> COALESCE(TRGT.closed_on_key,'');
