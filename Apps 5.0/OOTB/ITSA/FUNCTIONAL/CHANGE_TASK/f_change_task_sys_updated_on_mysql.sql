select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.sys_updated_on' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.change_task_final SRC
left join <<tenant>>_mdwdb.f_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(SRC.changed_on,'') <> coalesce(TRGT.sys_updated_on,'')







 



