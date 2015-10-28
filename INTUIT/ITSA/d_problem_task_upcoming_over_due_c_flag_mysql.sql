SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdwdb.d_problem_task a 
 inner join intuit_mdwdb.f_problem_task b on a.row_id=b.row_id and a.source_id=b.source_id 
 left join intuit_mdwdb.o_data_freshness c on a.source_id = c.source_id
where a.upcoming_over_due_c_flag <>
(case when a.due_on between c.lastupdated and date_add(c.lastupdated,INTERVAL 7 DAY) then 'Y' else  'N' end)
 and  b.state_src_code not in(3,4,7) ) temp