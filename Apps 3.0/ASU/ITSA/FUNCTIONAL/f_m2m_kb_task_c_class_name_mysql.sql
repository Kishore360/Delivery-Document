SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM asu_mdsdb.m2m_kb_task_final a
LEFT JOIN asu_mdsdb.task_final b on a.task=b.sys_id
left join  asu_mdwdb.f_m2m_kb_task_c c on a.sourceinstance=c.source_id AND c.ROW_ID=a.SYS_ID
WHERE b.sys_class_name <>c.class_name)A

