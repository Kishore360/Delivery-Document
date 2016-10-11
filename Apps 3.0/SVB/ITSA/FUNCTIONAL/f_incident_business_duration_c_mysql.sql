 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_business_duration_c' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.task_sla_final SRC 
 LEFT JOIN svb_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.business_duration)<>TRGT.business_duration_c