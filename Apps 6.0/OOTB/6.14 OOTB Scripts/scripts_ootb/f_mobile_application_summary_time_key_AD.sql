SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_mobile_application_summary.TIME_KEY' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.mobile_session_records_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT 

ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id 

LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_time app
ON (COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.time_series,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i'),'UNSPECIFIED'))=app.row_id  

WHERE coalesce(app.row_key, case when (COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.time_series,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'UNSPECIFIED')) is null then 0 else -1 end)<>
COALESCE(TRGT.TIME_KEY,-1)







 
 
 


 
 
 



