

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where   TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_resolution_duration)<>f.resolution_duration_c)temp
