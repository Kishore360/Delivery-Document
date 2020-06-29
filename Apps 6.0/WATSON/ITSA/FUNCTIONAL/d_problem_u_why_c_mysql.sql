
SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
ibmwatson_mdsdb.problem_final a12
 join ibmwatson_mdwdb.d_problem a122
on a122.row_id=a12.sys_id and a122.source_id=a12.sourceinstance
where a12.u_why <>a122.u_why_c)acv



