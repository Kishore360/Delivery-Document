 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN nypres_mdwdb.d_outage TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nypres_mdwdb.d_lov LKP 
 ON ( concat('STATE~CMDB_CI_OUTAGE~~~',upper(u_state))= LKP.row_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_state IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.state_src_c_key) 
