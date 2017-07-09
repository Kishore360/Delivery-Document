SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from wow_mdsdb.incident_final a
left join wow_mdwdb.f_incident b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
  left join wow_mdwdb.d_lov c 
on  CONCAT('CUSTOMER_IMPACTED~INCIDENT~~~',a.u_customer_impacted )=c.row_id and a.sourceinstance=c.source_id
 where 
c.row_key <> b.customer_impacted_c_key and  dimension_class = 'CUSTOMER_IMPACTED~INCIDENT')g