select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.knowledge_flag' ELSE 'SUCCESS' END as Message
from mcdonalds_mdsdb.change_task_final SRC
left join mcdonalds_mdwdb.d_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(case when SRC.knowledge = True then 'Y' else 'N' end,'') <> coalesce(TRGT.knowledge_flag,'')