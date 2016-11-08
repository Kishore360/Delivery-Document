SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
  FROM homedepot_mdsdb.incident_final SRC
 LEFT JOIN homedepot_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE 
 TIMESTAMPDIFF(SECOND,SRC.u_incident_start,SRC.u_incident_resolved_date_time) <> TRGT.mttr_c;