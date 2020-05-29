
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN  #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on LKP.row_id  = coalesce(date_format(COALESCE(convert_tz(SRC.requested_end_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d'))
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.requested_end_date IS NULL THEN '' else '-1' end)<> COALESCE(TRGT.requested_completion_on_key,'')
 
 
