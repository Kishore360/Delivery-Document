SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.company_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization LKP 
 ON ( CONCAT('SUBSIDIARY~', SRC.company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.company_key))temp;
 