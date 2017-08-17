SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
from(
SELECT count(1) as CNT
FROM rambus_mdsdb.incident_final a 
JOIN rambus_mdwdb.f_incident b ON a.sys_id =b.row_id  and a.sourceinstance=b.source_id
JOIN rambus_mdwdb.d_configuration_item c ON COALESCE(a.u_business_service,'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
WHERE 
b.soft_deleted_flag='N' and 
COALESCE(c.row_key,CASE WHEN a.u_business_service IS NULL THEN 0 ELSE -1 END)<>b.business_service_c_key 
) z;