
 
 
 	select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.change_request' ELSE 'SUCCESS' END as Message
from tjx_mdsdb.change_task_final SRC
left join tjx_mdwdb.f_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 left join tjx_mdwdb.d_change_request d
 on SRC.change_request = d.row_id and TRGT.source_id = d.source_id
 where coalesce(TRGT.change_request_key,'') <> coalesce(d.row_key,CASE WHEN SRC.change_request IS NULL THEN 0 else '-1' end)

