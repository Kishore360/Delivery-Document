SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for 
f_m2m_kb_task_c.request_task_key' ELSE 'SUCCESS' END as Message FROM 
(select count(1) as cnt from asu_mdsdb.m2m_kb_task_final i 
 left JOIN asu_mdsdb.task_final b on i.task=b.sys_id
 JOIN asu_mdwdb.d_request_task lkp
on i.task=lkp.row_id
 join asu_mdwdb.f_m2m_kb_task_c tgt
on  i.sys_id=tgt.row_id and i.sourceinstance=tgt.source_id
where b.sys_class_name='sc_task'
and 
 COALESCE(lkp.row_key,CASE WHEN i.task IS NULL THEN 0 else -1 end)<>(tgt.request_task_key))tmp
 
 
 
 
 
 