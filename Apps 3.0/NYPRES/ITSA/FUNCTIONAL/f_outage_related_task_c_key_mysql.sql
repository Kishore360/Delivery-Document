 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.outage_record_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.cmdb_ci_outage_final SRC 
 JOIN nypres_mdwdb.f_outage TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 join nypres_mdwdb.d_incident d on (SRC.u_related_task =d.row_id  
  AND SRC.sourceinstance= d.source_id )
  WHERE COALESCE(d.row_key,CASE WHEN SRC.u_related_task IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.related_task_c_key)  ;