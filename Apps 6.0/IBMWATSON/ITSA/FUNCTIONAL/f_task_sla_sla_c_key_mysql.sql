SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from 
(
SELECT 
count(1) cnt
FROM  
ibmwatson_mdwdb.f_task_sla a 
JOIN ibmwatson_mdsdb.task_sla_final b on  a.row_id = b.sys_id and b.sourceinstance=2
join ibmwatson_mdwdb.d_sla_c d on b.sys_id=d.row_id and d.source_id = b.sourceinstance 
where
a.sla_c_key <> coalesce(d.row_key,case when b.sys_id is null then 0 else -1 end)
)a;
