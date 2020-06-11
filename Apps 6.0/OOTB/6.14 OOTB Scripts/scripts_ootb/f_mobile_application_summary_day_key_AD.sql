SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_mobile_application_summary.DAY_KEY' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.mobile_session_records_final SRC 

LEFT JOIN #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT 

ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id

left join #DWH_TABLE_SCHEMA.d_calendar_date app

ON (COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.time_series,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'UNSPECIFIED'))=app.row_id  


WHERE coalesce(app.row_key, case when (COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.time_series,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'UNSPECIFIED')) is null then 0 else -1 end)<>
COALESCE(TRGT.DAY_KEY,'') 





 
 
 


 
 
 