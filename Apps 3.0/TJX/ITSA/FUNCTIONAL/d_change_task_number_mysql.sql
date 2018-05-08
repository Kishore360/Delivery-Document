select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.number' ELSE 'SUCCESS' END as Message
from tjx_mdsdb.change_task_final SRC
left join tjx_mdwdb.d_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(TRGT.change_task_number,'') <> coalesce(SRC.number,'')







 



