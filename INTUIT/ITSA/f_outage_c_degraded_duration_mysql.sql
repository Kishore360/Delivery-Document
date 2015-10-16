
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_configuration_item lkp
on lkp.row_id =  CASE WHEN s.type='degradation' THEN (s.u_percent_of_impact * TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.duration)/100)
     ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.duration)    END 
and lkp.source_id = s.sourceinstance
WHERE lkp.row_key <> t.degraded_duration) temp 

