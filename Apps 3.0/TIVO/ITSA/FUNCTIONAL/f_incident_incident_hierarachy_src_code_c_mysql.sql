
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(1) as cnt
from  tivo_mdwdb.f_incident a11
left join tivo_mdsdb.incident_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
where a12.u_incident_hierarachy<>a11.incident_hierarachy_src_code_c)a 