SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.closure_subcategory_src_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.incident_final SRC 
 LEFT JOIN nypres_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nypres_mdwdb.d_lov LKP 
 ON ( concat('SUBCATEGORY~INCIDENT~~~',upper(u_closure_subcategory))= LKP.row_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_closure_subcategory IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.closure_subcategory_c_key) 
 
 