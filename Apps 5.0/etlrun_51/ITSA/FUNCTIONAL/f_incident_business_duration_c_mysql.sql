SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.incident_final s
left join wow_mdwdb.f_incident t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where case when s.business_duration < '1970-01-01 00:00:00' THEN NULL ELSE TIMESTAMPDIFF(SECOND, '1970-01-01 00:00:00', s.business_duration) END <> business_duration_c) temp

