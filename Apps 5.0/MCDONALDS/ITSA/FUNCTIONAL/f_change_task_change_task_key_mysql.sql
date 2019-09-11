select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.change_task_key' ELSE 'SUCCESS' END as Message
from mcdonalds_mdsdb.change_task_final SRC
left join mcdonalds_mdwdb.f_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 left join mcdonalds_mdwdb.d_change_task d
 on d.row_id=SRC.sys_id
 and d.source_id=SRC.sourceinstance
 where coalesce(d.row_key,0) <> coalesce(TRGT.change_task_key,0)
 


