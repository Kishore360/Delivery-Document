 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt
from weillcornell_mdsdb.incident_final s
inner join weillcornell_mdwdb.f_incident i on s.sys_id=i.row_id  and i.row_key <100
and s.sourceinstance=i.source_id
where coalesce(timestampdiff(second,'1970-01-01 00:00:00',s.u_consult_time),'0') <>i.consult_time_c) c;


