select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.location' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.change_task_final SRC
left join <<tenant>>_mdwdb.f_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 left join <<tenant>>_mdwdb.d_location d
 on d.row_id = SRC.location
 where coalesce(d.row_key,0) <> coalesce(TRGT.location_key,0)

 

