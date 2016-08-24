  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.esaf_c_flag' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.sc_req_item_final SRC 
 LEFT JOIN nypres_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN u_esaf = 1 then 'Y' else 'N' END)<> (TRGT.esaf_c_flag) 