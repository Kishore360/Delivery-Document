SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.task_survey_final SRC 
 LEFT JOIN nbcu_mdwdb.f_task_survey TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left join nbcu_mdsdb.sys_user_final s_user
on SRC.taken_by=s_user.sys_id
 LEFT JOIN nbcu_mdwdb.d_internal_organization LKP 
 ON ( CONCAT('DEPARTMENT~', s_user.department)= LKP.row_id
AND SRC.sourceinstance= LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN s_user.department IS NULL THEN 0 else -1 end)<> (TRGT.taken_by_department_key)