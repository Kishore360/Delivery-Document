 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.type_of_item_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.sc_req_item_final SRC 
 LEFT JOIN nypres_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nypres_mdwdb.d_lov LKP 
 ON ( concat('U_TYPE_OF_ITEM~SC_REQ_ITEM~~~',upper(u_type_of_item))= LKP.row_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_type_of_item IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.type_of_item_c_key)
 
 