SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
watson_mdwdb.f_task_sla a 
JOIN watson_mdsdb.task_sla_final b on  a.row_id = b.sys_id and 
left join watson_mdwdb.d_sla_c d on u_type=d.row_id and d.source_id = b.sourceinstance 


where
a.sla_c_key <> coalesce(d.row_key,case when b.u_type is null then 0 else -1 end);



