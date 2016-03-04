SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from richemont_mdsdb.problem_final prob_source
left join richemontdev_mdwdb.d_problem prob
on prob_source.sys_id=prob.row_id and prob_source.sourceInstance=prob.source_id
left join richemont_mdsdb.metric_instance_final metc
on prob.row_id=metc.id
and metc.table='problem'
and metc.field='u_planned_resolution_date'
where metc.value<>prob.first_planned_resolution_date_c
)temp;


