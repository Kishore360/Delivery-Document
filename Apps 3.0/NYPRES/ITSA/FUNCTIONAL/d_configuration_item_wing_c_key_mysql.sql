SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.closure_subcategory_src_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.cmdb_ci_computer_final SRC 
 LEFT JOIN nypres_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nypres_mdwdb.d_lov LKP 
 ON ( concat('CATEGORY~INCIDENT~~~',upper(u_wing))= LKP.row_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_wing IS NULL THEN 0 else -1 end)<> (TRGT.wing_c_key) 
 
 
 

 

 
 