 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_has_breached_c_flag' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.task_sla_final SRC 
 LEFT JOIN svb_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where case when SRC.has_breached=1 then 'Y' else 'N' end<> TRGT.has_breached_c_flag	
 
 