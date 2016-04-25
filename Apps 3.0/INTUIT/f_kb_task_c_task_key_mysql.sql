SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_task lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when src.task is null then 0 else -1 end) <> tgt.task_key
) temp