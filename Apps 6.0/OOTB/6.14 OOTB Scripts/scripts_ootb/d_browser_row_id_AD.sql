SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_browser.row_id' ELSE 'SUCCESS' END as Message
FROM
#MDS_TABLE_SCHEMA.web_session_records_raw_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_browser TRGT 
ON CONCAT (COALESCE(SRC.deviceos,''),'~',COALESCE(SRC.browser,''),'~',COALESCE(SRC.browserversion,''))=TRGT.row_id  
AND SRC.sourceinstance=TRGT.source_id 
WHERE COALESCE(CONCAT(COALESCE(SRC.deviceos,''),'~',COALESCE(SRC.browser,''),'~',COALESCE(SRC.browserversion,'')),'')<> COALESCE(TRGT.ROW_ID,'')



 
 
 


 
 
 
 
 


 
 
 
 