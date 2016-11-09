SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM rei_mdsdb.task_sla_final SRC 
 LEFT JOIN rei_mdwdb.d_incident TRGT 
ON (SRC.task =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE  case when SRC.stage  = 'breached' then 'N' else 'Y' end<>TRGT.met_sla_flag 