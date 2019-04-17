SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.application_key' ELSE 'SUCCESS' END as Message
-- select distinct COALESCE( CONCAT('APPLICATION','~',a.u_application),'UNSPECIFIED'),c.row_id,
-- coalesce(c.row_key,case when a.u_application is null then 0 else -1 end),b.application_key 
from
rambus_mdsdb.task_final a
join rambus_mdwdb.f_task b 
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join rambus_mdwdb.d_application c
on COALESCE( CONCAT('APPLICATION','~',a.u_application),'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where coalesce(c.row_key,case when a.u_application is null then 0 else -1 end)<>b.application_key
;

