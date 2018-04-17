SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.closed_on' ELSE 'SUCCESS' END as Message  
FROM (SELECT count(1) as CNT 
FROM tjx_mdsdb.sc_req_item_final SRC  
LEFT JOIN tjx_mdwdb.d_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE category_name_c in ('ARMS') and convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_York')<> TRGT.closed_on)temp;


