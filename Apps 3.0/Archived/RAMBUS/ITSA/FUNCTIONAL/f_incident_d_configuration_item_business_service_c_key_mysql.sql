SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
 from rambus_mdwdb.f_incident a
INNER JOIN rambus_mdsdb.incident_final b 
ON a.row_id =b.sys_id 
AND a.source_id=b.sourceinstance
LEFT OUTER JOIN rambus_mdwdb.d_configuration_item c
 ON c.row_id = b.u_business_service  
 AND c.source_id =  b.sourceinstance
where a.business_service_c_key<>case when b.u_business_service is null then 0 else (c.row_key) end) z;
 