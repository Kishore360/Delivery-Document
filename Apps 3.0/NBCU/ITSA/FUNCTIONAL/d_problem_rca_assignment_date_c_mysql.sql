
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from nbcu_mdsdb.problem_final s
left  JOIN nbcu_mdwdb.d_problem t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
where  
convert_tz(s.u_rca_assignment_date,'GMT','America/New_York')
<> t.rca_assignment_date_c) temp

