SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.closure_subcategory_src_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.cmdb_ci_computer_final SRC 
JOIN nypres_mdwdb.f_configuration_item_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nypres_mdwdb.d_internal_contact LKP 
 ON concat('INTERNAL_CONTACT~', u_used_by)= LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_used_by IS NULL THEN 0 else -1 end)<> (TRGT.used_by_c_key) 
 
 
 
 
 