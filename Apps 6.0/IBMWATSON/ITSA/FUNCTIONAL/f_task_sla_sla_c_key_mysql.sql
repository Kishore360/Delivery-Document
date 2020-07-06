SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from 
-- select b.task,x.sys_id,b1.sys_id,d.row_id FROM  
ibmwatson_mdwdb.f_task_sla a 
JOIN ibmwatson_mdsdb.task_sla_final b on  a.row_id = b.sys_id and b.sourceinstance=2
JOIN ibmwatson_mdsdb.task_final x ON b.task=x.sys_id and b.sourceinstance=x.sourceinstance
join ibmwatson_mdsdb.contract_sla_final b1 on b.sla=b1.sys_id and b1.sourceinstance=2
left join ibmwatson_mdwdb.d_task_sla d on b1.sys_id=d.row_id and d.source_id = b.sourceinstance 


where
a.sla_c_key <> coalesce(d.row_key,case when b.sys_id is null then 0 else -1 end);



