SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from  tivo_mdwdb.d_incident a11
left join tivo_mdsdb.incident_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
where coalesce(a12.u_incident_type,'UNSPECIFIED')<>a11.incident_type_c