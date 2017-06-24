
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date lkp
on lkp.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(s.u_detect_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') 
WHERE lkp.row_key <> t.detect_key) temp 

