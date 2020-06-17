SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_ci_c.task_key' ELSE 'SUCCESS' END as Message 
FROM(select count(1) as cnt from bbandt_mdsdb.task_ci_final SRC 
JOIN bbandt_mdwdb.f_task_ci_c TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
left join bbandt_mdwdb.d_task lkp
on SRC.task=lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE lkp.dw_updated_on<TRGT.dw_updated_on and coalesce(lkp.row_key,case when SRC.task is NULL then 0 else -1 end) <> TRGT.task_key
and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma