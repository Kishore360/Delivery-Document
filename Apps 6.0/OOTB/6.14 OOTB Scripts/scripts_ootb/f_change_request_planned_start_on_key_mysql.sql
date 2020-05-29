SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_start_on_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM #MDS_TABLE_SCHEMA.change_request_final SRC
  JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.start_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0
 
)
 WHERE coalesce(LKP.row_key,case when SRC.start_date is null then 0 else -1 end)<> (TRGT.planned_start_on_key))temp;
