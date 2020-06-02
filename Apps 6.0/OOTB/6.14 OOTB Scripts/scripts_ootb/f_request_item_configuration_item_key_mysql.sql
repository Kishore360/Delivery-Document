SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT 
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci  IS NULL THEN 0 ELSE -1 END )
<> (TRGT.configuration_item_key)) temp;


 