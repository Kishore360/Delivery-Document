SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM 
 tjx_mdsdb.sc_req_item_final SRC 
 LEFT JOIN tjx_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE category_name_c in ('ARMS') and length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description) temp;
 
 