SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM wpl_mdsdb.task_sla_final SRC 
LEFT JOIN wpl_mdwdb.d_task_sla TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE CONVERT_TZ (SRC.end_time,'GMT','America/New_York') <> TRGT.end_time_c
and SRC.CDCTYPE<>'D'