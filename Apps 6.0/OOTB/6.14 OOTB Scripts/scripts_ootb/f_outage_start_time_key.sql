
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.start_time_key' ELSE 'SUCCESS - Without NULL handling' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_time LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.begin,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i')  and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.begin IS NULL THEN 0 else '-1' end) <>  COALESCE(TRGT.start_time_key,'0') 
