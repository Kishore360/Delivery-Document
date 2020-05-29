SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.DAY_KEY' ELSE 'SUCCESS' END as Message

 from #MDS_TABLE_SCHEMA.web_session_records_final SRC
 LEFT JOIN  #DWH_TABLE_SCHEMA.f_browser_application_summary TRGT 
 ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date dct
 ON COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.time_series,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'UNSPECIFIED') = dct.row_id 

 
 WHERE COALESCE(dct.row_key, case when COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.time_series,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),
 'UNSPECIFIED') is null then 0 else -1 end) <> COALESCE(TRGT.DAY_KEY,'') 
 
 
 