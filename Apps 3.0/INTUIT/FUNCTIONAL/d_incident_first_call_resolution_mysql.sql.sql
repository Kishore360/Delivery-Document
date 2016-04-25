SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.incident_final b 
left JOIN intuit_mdwdb.d_incident a
ON a.row_id = b.sys_id AND a.source_id = b.sourceinstance
where a.first_call_resolution_flag <> CASE WHEN b.u_fcr=1 THEN 'Y' ELSE 'N'END)g


