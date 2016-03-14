SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from richemont_mdsdb.problem_final a
left join richemontdev_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceInstance=b.source_id
where b.planned_resolution_date_c<>a.u_planned_resolution_date) temp;