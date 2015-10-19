SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date  lkp
on lkp.row_id =CONVERT_TZ (s.begin,'GMT','America/Los_Angeles') and lkp.source_id = s.sourceinstance
WHERE lkp.row_key <> t.pivot_date) temp 
