
 

 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.APPLICATION_KEY' ELSE 'SUCCESS' END as Message

 
 from #MDS_TABLE_SCHEMA.web_session_records_final SRC1
 left join  #MDS_TABLE_SCHEMA.web_session_records_raw_final SRC ON 
 SRC.sessionguid =SRC1.sessionguid


 LEFT JOIN #DWH_TABLE_SCHEMA.f_browser_application_summary TRGT 
 ON SRC1.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application app
 
 ON COALESCE(CONCAT('APPLICATION~',SRC.appkey),'') = app.row_id
 
 WHERE COALESCE(app.row_key, case when SRC.appkey is null then 0 else -1 end ) <> COALESCE(TRGT.APPLICATION_KEY,'');
 
