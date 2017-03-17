

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_m2m_kb_task_c.incident_key' ELSE 'SUCCESS' END as Message FROM asu_mdsdb.m2m_kb_task_final i 
LEFT JOIN asu_mdsdb.task_final b on i.task=b.sys_id 
LEFT JOIN asu_mdwdb.d_incident lkp
on i.task=lkp.row_id
left join asu_mdwdb.f_m2m_kb_task_c TRGT
on  i.sys_id=TRGT.row_id and i.sourceinstance=TRGT.source_id
where b.sys_class_name='incident'
and 
 COALESCE(lkp.row_key,CASE WHEN i.task IS NULL THEN 0 else -1 end)<> (TRGT.incident_key)




