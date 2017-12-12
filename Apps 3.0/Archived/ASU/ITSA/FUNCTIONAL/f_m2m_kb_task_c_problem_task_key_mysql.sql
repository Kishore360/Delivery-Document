
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_m2m_kb_task_c.problem_task_key' ELSE 'SUCCESS' END as Message FROM asu_mdsdb.m2m_kb_task_final i 
LEFT JOIN asu_mdsdb.task_final b on i.task=b.sys_id
LEFT JOIN asu_mdwdb.d_problem_task lkp
on i.task=lkp.row_id
left join asu_mdwdb.f_m2m_kb_task_c tgt
on  i.sys_id=tgt.row_id and i.sourceinstance=tgt.source_id
where b.sys_class_name='problem_task'
and 
 COALESCE(lkp.row_key,CASE WHEN i.task IS NULL THEN 0 else -1 end)<>(tgt.problem_task_key)