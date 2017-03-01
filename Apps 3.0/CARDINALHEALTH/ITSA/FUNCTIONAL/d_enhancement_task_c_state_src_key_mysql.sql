


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select Count(1) as cnt
FROM cardinalhealth_mdsdb.u_enhancement_task_final i 
JOIN cardinalhealth_mdwdb.d_enhancement_task_c f 
ON i.sys_id=f.row_id AND i.sourceinstance=f.source_id 
join cardinalhealth_mdwdb.d_lov d
on COALESCE(CONCAT('STATE_C','~','ENHANCEMENT_TASK','~','~','~',UPPER(state)),'UNSPECIFIED') =d.row_id    
where coalesce(d.row_key,case when i.state is null then 0 else -1 end) <> f.state_src_key)a





