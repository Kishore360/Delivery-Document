

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  watson_mdsdb.incident_final a11
 join watson_mdwdb.d_incident  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
where convert_tz(u_outage_start,'GMT','UTC')   <>a12.u_outage_start_c )a


