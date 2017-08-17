SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from rambus_mdsdb.task_final a
 join rambus_mdwdb.d_service c 
on coalesce(concat('BUSINESS_SERVICE~',a.u_business_service),'UNSPECIFIED')=c.row_id
and a.sourceinstance=c.source_id
 join rambus_mdwdb.f_task b 
on a.sourceinstance=b.source_id and a.sys_id=b.row_id
WHERE b.soft_deleted_flag='N'
and COALESCE(c.row_key,CASE WHEN a.u_business_service IS NULL THEN 0 ELSE -1 END)<>b.business_service_key 
)i; 


