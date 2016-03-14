SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from richemont_mdsdb.problem_final a
left join richemontdev_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceInstance=b.source_id
left join richemont_mdsdb.metric_instance_final c
on b.row_id=c.id
and c.table='problem'
and c.field='u_planned_resolution_date'
where (DATE_FORMAT(CONVERT_TZ(c.value,'GMT','Europe/Zurich'),'%Y/%m/%d %h:%i:%s'))<> b.first_planned_resolution_date_c
)temp;