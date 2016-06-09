SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from mercuryins_mdsdb.change_request_final s
left join mercuryins_mdwdb.d_change_request  t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE convert_tz(s.start_date,'GMT','America/Los_Angeles')<> t.planned_start_on
) c