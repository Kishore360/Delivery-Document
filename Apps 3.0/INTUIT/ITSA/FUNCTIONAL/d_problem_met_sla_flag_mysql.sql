
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdwdb.f_problem s
left join intuit_mdwdb.d_problem t 
on s.row_id=t.row_id and s.source_id=t.source_id
where t.met_sla_flag <> case when s.state_src_code=4 and s.priority_src_code IN ( '1', '2' )AND Timestampdiff(day, t.opened_on,t.post_mortem_schedule_c) BETWEEN 0 AND 2 
THEN 'Y' ELSE 'N' END
) temp