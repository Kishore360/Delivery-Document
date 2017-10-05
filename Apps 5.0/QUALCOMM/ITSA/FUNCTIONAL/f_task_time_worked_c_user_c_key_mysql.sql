SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM
            qualcomm_mdsdb.task_time_worked_final task_time_worked        
        LEFT OUTER JOIN
            qualcomm_mdsdb.task_final task 
                ON task_time_worked.task = task.sys_id 
                AND task_time_worked.sourceinstance = task.sourceinstance  
                and task.sys_class_name in (                'incident','sc_task'
            )	left join qualcomm_mdwdb.d_internal_contact LKP 
				on CONCAT('INTERNAL_CONTACT~',task_time_worked.user)=LKP.row_id and task_time_worked.sourceinstance=LKP.source_id
                join qualcomm_mdwdb.f_task_time_worked_c f on task_time_worked.sys_id=f.row_id
        WHERE coalesce(LKP.row_key,case when task_time_worked.user is null then  0 else -1 end)<>user_c_key  
		
		
		