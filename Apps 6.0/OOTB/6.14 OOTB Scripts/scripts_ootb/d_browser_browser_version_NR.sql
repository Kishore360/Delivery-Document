SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_browser.browser_version' ELSE 'SUCCESS' END as Message
FROM
#MDS_TABLE_SCHEMA.PageView_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_browser TRGT 
ON CONCAT(SRC.useragentname ,'~', SRC.useragentversion, '~', SRC.useragentos, '~', SRC.devicetype)=TRGT.row_id  
AND SRC.sourceinstance=TRGT.source_id 
WHERE COALESCE(SRC.useragentversion,'')<> COALESCE(TRGT.browser_version,'')