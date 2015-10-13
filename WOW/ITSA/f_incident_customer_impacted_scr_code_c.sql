SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.incident_final a
left join wow_mdwdb.f_incident b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
 where a.u_customer_impacted  <> b.customer_impacted_src_code_c)g