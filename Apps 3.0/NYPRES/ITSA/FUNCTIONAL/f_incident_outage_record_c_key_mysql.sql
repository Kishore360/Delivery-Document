 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.outage_src_c_key' ELSE 'SUCCESS' END as Message
FROM nypres_mdsdb.incident_final SRC 
  JOIN nypres_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN nypres_mdsdb.cmdb_ci_outage_final	 LKP 
 ON ( (u_outage_record))= LKP.sys_id 
join nypres_mdwdb.d_incident d on (SRC.sys_id =d.row_id  
 AND SRC.sourceinstance= d.source_id )
 WHERE COALESCE(d.row_key,CASE WHEN SRC.u_outage_record IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.outage_record_c_key)  ;