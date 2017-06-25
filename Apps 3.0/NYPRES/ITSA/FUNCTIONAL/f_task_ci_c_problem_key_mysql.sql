SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for f_task_ci_c.problem_key' ELSE 'SUCCESS' END as Message 
FROM nypres_mdsdb.task_ci_final SRC 
JOIN nypres_mdwdb.f_task_ci_c TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join nypres_mdwdb.d_problem lkp
on SRC.task=lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE coalesce(lkp.row_key,case when SRC.task is NULL
then 0 else -1 end) <> TRGT.problem_key