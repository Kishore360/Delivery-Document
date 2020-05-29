SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.catalog_item_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and TRGT.soft_deleted_flag='N' )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_master_item LKP 
 ON ( SRC.cat_item= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cat_item IS NULL THEN 0 else -1 end)<> (TRGT.catalog_item_key))temp;
 
