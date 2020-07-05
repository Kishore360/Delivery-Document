
SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
ibmwatson_mdsdb.task_sla_final a12
left join ibmwatson_mdwdb.d_problem a14 on a12.u_case=a14.row_id and a12.sourceinstance=a14.source_id
 join ibmwatson_mdwdb.d_sla_c a122
on a122.row_id=a12.sys_id and a122.source_id=a12.sourceinstance
where coalesce(a14.row_key,case when a12.u_case is null then 0 else -1 end)<>a122.problem_c_key)acv

