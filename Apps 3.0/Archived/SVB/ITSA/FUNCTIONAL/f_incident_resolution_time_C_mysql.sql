SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_resolution_time_C' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.task_sla_final SRC 
 LEFT JOIN svb_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.duration)<>TRGT.resolution_time_C
 
 