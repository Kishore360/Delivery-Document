SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y')TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on LKP.row_id  = coalesce(date_format(COALESCE(convert_tz(SRC.actual_start_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d'))
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.actual_start_date IS NULL THEN '' else '-1' end)<> COALESCE(TRGT.work_start_on_key,'')
 