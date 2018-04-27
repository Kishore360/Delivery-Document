select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.task_type_src_code' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.change_task_final SRC
left join <<tenant>>_mdwdb.d_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(TRGT.task_type_src_code,'') <> coalesce(SRC.sys_class_name,'')







 



