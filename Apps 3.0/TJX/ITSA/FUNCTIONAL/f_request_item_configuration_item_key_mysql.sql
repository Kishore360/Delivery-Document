SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT 
 FROM tjx_mdsdb.sc_req_item_final SRC 
 LEFT JOIN tjx_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN tjx_mdwdb.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
  join tjx_mdwdb.d_request_item a19 on (TRGT.request_item_key = a19.row_key)  where category_name_c in ('ARMS') and COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci  IS NULL THEN 0 ELSE -1 END )
<> (TRGT.configuration_item_key)) temp;


 