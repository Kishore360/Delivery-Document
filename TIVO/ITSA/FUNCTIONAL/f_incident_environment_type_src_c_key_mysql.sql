SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from tivo_mdsdb.incident_final a11
join tivo_mdwdb.f_incident a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
left join tivo_mdwdb.d_lov a13
on concat('ENVIRONMENT_TYPE~INCIDENT~~~',a11.u_environment_type)=a13.row_id
where coalesce(a13.row_key,CASE WHEN a11.u_environment_type IS NULL THEN 0 else -1 end)<>a12.environment_type_src_c_key)a