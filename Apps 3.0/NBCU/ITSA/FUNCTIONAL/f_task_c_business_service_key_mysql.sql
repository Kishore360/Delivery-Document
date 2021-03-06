SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from nbcu_mdsdb.task_final a
 join nbcu_mdwdb.d_service c 
on coalesce(concat('BUSINESS_SERVICE~',a.business_service),'UNSPECIFIED')=c.row_id
and a.sourceinstance=c.source_id
 join nbcu_mdwdb.f_task_c b 
on a.sourceinstance=b.source_id and a.sys_id=b.row_id
WHERE c.row_key<>b.business_service_key 
)i; 

