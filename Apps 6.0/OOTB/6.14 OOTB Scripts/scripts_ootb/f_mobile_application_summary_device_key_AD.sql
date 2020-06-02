SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_mobile_application_summary.DEVICE_KEY' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.mobile_session_records_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT 
ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_device app
ON  (COALESCE(CONCAT('DEVICE~',SRC.devicename,'~',SRC.carrier),'UNSPECIFIED')=app.row_id  
AND SRC.sourceinstance=app.source_id)
where coalesce(app.row_key, case when COALESCE(CONCAT('DEVICE~',SRC.devicename,'~',SRC.carrier)) is null then 0 else -1 end)
<>coalesce(TRGT.device_key,'') 

