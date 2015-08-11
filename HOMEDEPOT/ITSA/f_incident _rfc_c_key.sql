

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.incident_final a
 left  JOIN  homedepot_mdwdb.f_incident b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
left join homedepot_mdwdb.d_change_request c
on a.rfc=c.row_id and  c.source_id=a.sourceinstance
 where c.row_key <> b.rfc_change_request_c_key)b