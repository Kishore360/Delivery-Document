SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from cardinalhealth_mdwdb.f_task_sla a
join
cardinalhealth_mdwdb.d_request_task b
on a.request_task_key=b.row_key
where a.actual_time_left_c <>b.days_to_breach_sla_c)c