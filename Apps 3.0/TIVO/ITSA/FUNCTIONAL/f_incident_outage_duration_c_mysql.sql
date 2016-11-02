SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from
tivo_mdsdb.incident_final src 
join tivo_mdwdb.f_incident stg
ON stg.row_id = src.sys_id AND stg.source_id = src.sourceinstance
where  stg.outage_duration_c <> TIMESTAMPDIFF(SECOND,src.u_outage_start,src.u_outage_end)

)b

