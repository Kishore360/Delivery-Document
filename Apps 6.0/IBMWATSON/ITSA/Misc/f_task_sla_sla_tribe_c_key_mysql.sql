

------
SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
ibmwatson_mdsdb.task_sla_final a12
left join ibmwatson_mdsdb
left join ibmwatson_mdwdb.d_tribe_c a14 on a12.u_tribe=a14.row_id and a12.sourceinstance=a14.source_id
join ibmwatson_mdwdb.f_task_sla a122 on a122.row_id=a12.sys_id and a122.source_id=a12.sourceinstance
where coalesce(a14.row_key,case when a12.u_tribe is null then 0 else -1 end)<>a122.sla_tribe_c_key)acv