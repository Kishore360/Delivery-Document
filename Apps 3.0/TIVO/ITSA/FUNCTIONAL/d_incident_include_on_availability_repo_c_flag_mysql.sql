SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from tivo_mdsdb.incident_final a11
join tivo_mdwdb.d_incident a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
where 
coalesce(case when a11.u_include_on_availability_repo =1 then 'Y' else 'N' end ,'')<>
coalesce(a12.include_on_availability_repo_c_flag,''))a
