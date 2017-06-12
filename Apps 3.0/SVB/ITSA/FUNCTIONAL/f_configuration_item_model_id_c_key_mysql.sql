SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.closure_subcategory_src_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN nypres_mdsdb.cmn_model_final LKP 
 ON  SRC.model_id= LKP.sys_id  AND SRC.sourceinstance= LKP.sourceinstance 
  JOIN nypres_mdwdb.f_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.model_id IS NULL THEN 0 else -1 end)<> (TRGT.model_id_c_key) 
 
 
 
 
 

