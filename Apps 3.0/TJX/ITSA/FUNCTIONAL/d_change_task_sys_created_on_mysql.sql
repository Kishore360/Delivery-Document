select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.sys_created_on' ELSE 'SUCCESS' END as Message
from tjx_mdsdb.change_task_final SRC
left join tjx_mdwdb.d_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(TRGT.created_on,'') <> convert_tz(SRC.sys_created_on,'GMT','America/New_York')









 



