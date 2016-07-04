SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.incident_final a
 left  JOIN   homedepot_mdwdb.d_incident b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where convert_tz(a.u_ito_engaged_time,'GMT','America/New_York') <> b.ito_engaged_time_c) temp;
 
