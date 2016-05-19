SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.incident_final a
left join homedepot_mdsdb.u_situation c
on a.u_situation=c.sys_id
 left  JOIN homedepot_mdwdb.d_incident b 
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 where c.u_name <> b.situation_c)b