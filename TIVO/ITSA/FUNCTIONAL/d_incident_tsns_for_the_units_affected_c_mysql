SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from tivo_mdsdb.incident_final a11
left join tivo_mdwdb.d_incident a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
where coalesce(a11.u_tsns_for_the_units_affected_,'')<>coalesce(a12.tsns_for_the_units_affected_c,''))a