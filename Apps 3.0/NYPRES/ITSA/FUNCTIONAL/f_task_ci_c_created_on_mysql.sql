SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for f_task_ci_c.created_on' ELSE 'SUCCESS' END as Message 
 FROM nypres_mdsdb.task_final SRC 
 LEFT JOIN nypres_mdwdb.f_task_ci_c TRGT 
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(SRC.sys_created_on,'GMT',
'America/New_York')<> TRGT.created_on 