SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.u_expected_downtime_duration),0)
 <> t.expected_downtime_duration_c) temp