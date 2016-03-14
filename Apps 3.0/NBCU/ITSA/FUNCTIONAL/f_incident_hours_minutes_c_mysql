SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.f_incident a11
left join nbcu_mdsdb.incident_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
where COALESCE(timestampdiff(SECOND, '1970-01-01 00:00:00',a12.u_hours_minutes),null)<>11.hours_minutes_c)a