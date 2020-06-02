SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_task.opened_on' ELSE 'SUCCESS' END as Message 
FROM (select count(1)cnt from 
(select CONVERT_TZ(src.sys_created_on,'GMT','America/New_York') SRC , trgt.created_on TRGT from  gilead_mdsdb.task_final  src
 join gilead_mdwdb.d_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id  and sys_class_name='problem')a
WHERE SRC <> TRGT) temp;