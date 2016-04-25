SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.problem_final s
left join intuit_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.post_mortem_schedule_c<>CONVERT_TZ(s.u_post_mortem_schedule_date,'GMT' ,'America/Los_Angeles')) temp