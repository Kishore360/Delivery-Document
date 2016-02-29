SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from tivo_mdsdb.incident_final a11
left join tivo_mdwdb.d_incident a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
left join tivo_mdsdb.kb_knowledge_final a13
on a12.u_knowledge_utilized=a13.sys_id
where coalesce(a13.number,'')<>a12.knowledge_number_c)a
