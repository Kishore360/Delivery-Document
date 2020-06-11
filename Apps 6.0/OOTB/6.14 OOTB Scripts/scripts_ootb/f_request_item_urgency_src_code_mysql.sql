SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.urgency_src_code' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND TRGT.soft_deleted_flag = 'N'  )
 WHERE COALESCE( SRC.urgency,'')<> COALESCE(TRGT.urgency_src_code ,''))temp;
 
