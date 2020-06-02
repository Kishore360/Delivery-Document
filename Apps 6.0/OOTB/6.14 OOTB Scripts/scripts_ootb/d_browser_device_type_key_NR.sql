SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_browser.device_type_key' ELSE 'SUCCESS' END as Message
FROM
#MDS_TABLE_SCHEMA.PageView_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_browser TRGT 
ON CONCAT(SRC.useragentname ,'~', SRC.useragentversion, '~', SRC.useragentos, '~', SRC.devicetype)=TRGT.row_id  
AND SRC.sourceinstance=TRGT.source_id 
left join #DWH_TABLE_SCHEMA.d_lov lov
 on lov.row_id = CONCAT('DEVICE_TYPE~',SRC.devicetype) and lov.source_id = SRC.sourceinstance
WHERE COALESCE(lov.row_key,case when SRC.devicetype is null then 0 else -1 end,'')<> COALESCE(TRGT.browser_device_type_key,'')