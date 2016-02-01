SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from tivo_mdsdb.incident_final a11
left join tivo_mdwdb.f_incident a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
where coalesce(a11.u_verification_code,'')<>coalesce(a12.verification_src_code_c,''))a