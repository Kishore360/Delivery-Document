

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.catalog_item_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.sc_req_item_final SRC 
 LEFT JOIN nypres_mdwdb.f_request_item_variable_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN nypres_mdwdb.d_master_item LKP 
 ON ( SRC.cat_item= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cat_item IS NULL THEN 0 else -1 end)<> (TRGT.catalog_item_key)