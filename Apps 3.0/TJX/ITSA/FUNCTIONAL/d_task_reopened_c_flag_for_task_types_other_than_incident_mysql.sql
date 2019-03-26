SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_task.reopened_c_flag' ELSE 'SUCCESS' END as Message 

FROM 

(select count(1) as cnt 
from 
(select sys_id, sourceinstance, sys_class_name from tjx_mdsdb.task_final where sys_class_name = 'Incident' ) src
 
 JOIN (select sys_id, sourceinstance, reopen_count from  tjx_mdsdb.incident_final) i 

ON src.sys_id = i.sys_id AND src.sourceinstance = i.sourceinstance 

join (select row_id, source_id, reopened_c_flag from tjx_mdwdb.d_task where soft_deleted_flag='N' and task_type='incident') trgt 

on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 

WHERE sys_class_name = 'Incident' and  case when src.sys_class_name = 'Incident' then IF(i.reopen_count>0,'Y','N') else 'X' end
   <> trgt.reopened_c_flag) temp;