SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_approval_c.approval_task_type

' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_approver_final SRC 
LEFT JOIN qualcomm_mdsdb.task_final task 
                ON SRC.sysapproval = task.sys_id 

LEFT JOIN qualcomm_mdwdb.f_task_approval_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  left join qualcomm_mdwdb.d_change_request LKP 
	on COALESCE(SRC.sysapproval ,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id

 WHERE case 
                when task.sys_class_name='incident' then 'Incident'  
                when task.sys_class_name='sc_req_item' then 'Request Item'  
                when task.sys_class_name='sc_task' then 'Request Task'  
                when task.sys_class_name='new_call' then 'New Call'  
                when task.sys_class_name='u_walk_up_call' then 'Walk Up Call'  
                when task.sys_class_name='u_major_incident' then 'Major Incident' 
                when task.sys_class_name = 'change_request' then  'Change Request'  
                else task.sys_class_name 
            end  <> (TRGT.approval_task_type



);
