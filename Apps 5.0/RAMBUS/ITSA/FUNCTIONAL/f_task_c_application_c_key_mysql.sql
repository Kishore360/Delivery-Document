SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.application_key' ELSE 'SUCCESS' END as Message
from
rambus_mdwdb.f_task a
join rambus_mdsdb.task_final b
on a.row_id=b.sys_id and a.source_id=b.sourceinstance
join rambus_mdwdb.d_application stg
on stg.row_id =COALESCE( CONCAT('APPLICATION','~',b.u_application),'UNSPECIFIED') 
and a.soft_deleted_flag='N'
where
a.application_key<>case when b.u_application is null then 0 else stg.row_key end ;


