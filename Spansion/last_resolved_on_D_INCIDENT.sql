SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( 
select COUNT(*) as cnt
from spansion_mdsdb.incident_final s inner join spansion_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance = i.source_id where
CONVERT_TZ(coalesce(u_resolve_time,'0'),'GMT','America/Los_Angeles') <>i.last_resolved_on
)c