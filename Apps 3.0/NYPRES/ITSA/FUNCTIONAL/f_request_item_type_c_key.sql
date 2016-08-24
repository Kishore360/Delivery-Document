SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.type_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.sc_req_item_final SRC 
 join nypres_mdwdb.f_request_item trgt on SRC.sys_id=trgt.row_id and SRC.sourceinstance=trgt.source_id
 LEFT JOIN nypres_mdwdb.d_master_item LKP 
 ON ( SRC.u_type= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_type IS NULL THEN 0 else -1 end)<> (trgt.type_c_key)
 
 