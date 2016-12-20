select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_request_task lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where case when lkp1.sys_class_name <>'sc_task'
then 0 else lkp.row_Key end <> tgt.request_task_key