SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.m2m_kb_task_final i 
 LEFT JOIN intuit_mdsdb.task_final b
    on i.task=b.sys_id
    and b.sys_class_name<>'ticket'
JOIN intuit_mdwdb.d_incident_task_c d_cr ON COALESCE(i.kb_knowledge,'UNSPECIFIED')=row_id and i.sourceinstance=source_id
join intuit_mdwdb.f_kb_task_c f_cr  on i.sys_id=f_cr.row_id and i.sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when kb_knowledge is null then 0 else -1 end )<>f_cr.kb_knowledge_c_key 