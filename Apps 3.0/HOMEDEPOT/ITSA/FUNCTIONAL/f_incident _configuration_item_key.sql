SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.incident_final a
left JOIN homedepot_mdwdb.d_configuration_item c
on a.cmdb_ci= c.row_id and a.sourceinstance=c.source_id
 left  JOIN  homedepot_mdwdb.f_incident b
on  a.sys_id = b.ROW_ID and a.sourceinstance=b.source_id
 where c.row_key <> b.configuration_item_key  )b
