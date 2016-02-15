SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) as cnt
from homedepot_mdsdb.incident_final a
   JOIN  homedepot_mdwdb.d_incident b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 where  DATE_FORMAT(CONVERT_TZ(a.u_incident_resolved_date_time,'GMT','America/New_York'),'%Y%m%d%h%m%s')<> DATE_FORMAT(b.last_resolved_on,'%Y%m%d%h%m%s')

)b