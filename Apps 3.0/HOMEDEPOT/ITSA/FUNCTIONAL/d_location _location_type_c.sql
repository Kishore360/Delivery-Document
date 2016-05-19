SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.cmn_location a
left join homedepot_mdsdb.incident_final c
on a.sys_id=c.location and a.sourceinstance=c.sourceinstance 
 left  JOIN homedepot_mdwdb.d_location b 
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id 
 where coalesce(a.u_location_type,'UNSPECIFIED') <> b.location_type_code ) b