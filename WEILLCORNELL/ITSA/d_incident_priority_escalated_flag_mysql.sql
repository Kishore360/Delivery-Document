 

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.priority_escalated_flag' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.incident_final SRC 
 LEFT JOIN weillcornell_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN (select * from weillcornell_mdwdb.f_t_task_activity where
task_wh_type = 'incident' 
AND task_attribute_wh_name =  'priority' AND task_attribute_wh_old_value IS NOT NULL 
AND task_attribute_wh_new_value IS NOT NULL   
AND  task_attribute_wh_new_value < task_attribute_wh_old_value 
)  ta on
TRGT.row_id = ta.task_row_id AND TRGT.source_id = ta.source_id   

 WHERE  CASE WHEN  ta.task_attribute_wh_new_value < ta.task_attribute_wh_old_value
THEN 'Y' ELSE 'N' END
<> COALESCE(TRGT.priority_escalated_flag,'')
 and    SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' ) 



