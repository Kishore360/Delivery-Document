SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.end_on' ELSE 'SUCCESS' END as Message 
FROM ingrammicro_mdsdb.task_sla_final  SRC JOIN ingrammicro_mdwdb.f_task_sla TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE CONVERT_TZ(SRC.end_time,'GMT','America/Los_Angeles') <> (TRGT.end_on) 
and SRC.cdctype='X';


