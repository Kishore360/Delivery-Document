SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.created_on' ELSE 'SUCCESS' END as Message  
FROM (SELECT count(1) as CNT 
FROM tjx_mdsdb.sc_req_item_final SRC  LEFT JOIN tjx_mdwdb.f_request_item TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
  join tjx_mdwdb.d_request_item a19 on (TRGT.request_item_key = a19.row_key)  where category_name_c in ('ARMS') and convert_tz(SRC.sys_created_on,'GMT','America/New_York')<> TRGT.created_on)temp;
 
