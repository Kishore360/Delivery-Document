SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from tivo_mdsdb.incident_final a11
left join tivo_mdwdb.f_incident a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
where TIMESTAMPDIFF(second,'1970-01-01 00:00:00',a11.u_time_to_restoration)<>a12.time_to_restoration_duration_c )a
