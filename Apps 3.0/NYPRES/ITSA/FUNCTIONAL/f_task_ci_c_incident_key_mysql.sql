	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for f_task_ci_c.incident_key' ELSE 'SUCCESS' END as Message 
 FROM nypres_mdsdb.task_ci_final SRC 
 LEFT JOIN nypres_mdwdb.f_task_ci_c TRGT 
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
left join nypres_mdwdb.d_incident lkp
on SRC.sys_id=lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE coalesce(lkp.row_key,case when SRC.task is NULL
then 0 else -1 end) <> TRGT.incident_key