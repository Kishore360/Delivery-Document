
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.catalog_item_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.sc_req_item_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN cardinalhealth_mdwdb.d_master_item LKP 
on COALESCE(SRC.cat_item,'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cat_item IS NULL THEN 0 else -1 end)<> (TRGT.catalog_item_key)
 
 
 
 
 

