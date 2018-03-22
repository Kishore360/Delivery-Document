SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for f_task_ci_c.problem_key' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdsdb.task_ci_final SRC 
JOIN bbandt_mdwdb.f_task_ci_c TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
left join bbandt_mdwdb.d_configuration_item lkp
on SRC.ci_item=lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE lkp.dw_updated_on<TRGT.dw_updated_on and  coalesce(lkp.row_key,case when SRC.ci_item is NULL
then 0 else -1 end) <> TRGT.configuration_item_key


