SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.active_flag' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM tjx_mdsdb.sc_req_item_final SRC 
  JOIN tjx_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 WHERE category_name_c in ('ARMS') and ( CASE WHEN SRC.active =1 then 'Y' else 'N' END)<> (TRGT.active_flag )) temp;
 
