
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from gilead_mdsdb.incident_final a
left join gilead_mdwdb.d_incident b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
 where a.u_latest_customer_update <> b.latest_customer_update_c )g