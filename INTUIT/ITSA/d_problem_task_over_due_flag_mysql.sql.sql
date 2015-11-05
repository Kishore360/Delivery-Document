SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdwdb.d_problem_task a
left join intuit_mdwdb.f_problem_task b
on  a.row_id=b.row_id AND a.source_id=b.source_id 
left join intuit_mdwdb.d_o_data_freshness c 
ON a.source_id = c.source_id
 AND  c.etl_run_number = b.etl_run_number
WHERE a.over_due_flag  <>  CASE WHEN a.due_on < c.lastupdated AND b.state_src_code NOT IN (3,4,7)THEN 'Y' ELSE 'N' END) temp