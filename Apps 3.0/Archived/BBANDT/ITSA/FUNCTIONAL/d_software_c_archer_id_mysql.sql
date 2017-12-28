SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_software_c.archer_id' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.cmdb_ci_spkg_final SRC 
 LEFT JOIN bbandt_mdwdb.d_software_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.u_archer_id,'')<> COALESCE(TRGT.archer_id ,'')
