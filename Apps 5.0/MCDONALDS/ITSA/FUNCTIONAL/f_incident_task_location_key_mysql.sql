select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_task_task.location' ELSE 'SUCCESS' END as Message
from mcdonalds_mdsdb.incident_task_task_final SRC
left join mcdonalds_mdwdb.f_incident_task_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 left join mcdonalds_mdwdb.d_location d
 on d.row_id = SRC.location
 where coalesce(d.row_key,0) <> coalesce(TRGT.location_key,0)

 

