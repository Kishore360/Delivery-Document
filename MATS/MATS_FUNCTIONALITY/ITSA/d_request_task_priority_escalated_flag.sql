

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.priority_escalated_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.problem_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN <<tenant>>_mdwdb.f_t_task_activity TA 
 ON (SRC.sys_id =TA.task_row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 AND TA.task_wh_type = 'problem' 
AND TA.task_attribute_wh_name =  'priority' and TA.task_attribute_wh_old_value IS NOT NULL AND TA.task_attribute_wh_new_value IS NOT NULL   
AND  TA.task_attribute_wh_new_value < TA.task_attribute_wh_old_value
 WHERE  CASE WHEN TA.task_attribute_wh_old_value IS NOT NULL AND TA.task_attribute_wh_new_value IS NOT NULL   
AND  TA.task_attribute_wh_new_value < TA.task_attribute_wh_old_value 
THEN 'Y' ELSE 'N' END
<> COALESCE(TRGT.priority_escalated_flag,'')

