
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.rescheduled_flag' ELSE 'SUCCESS' END as Message
 FROM(
 select count(1) cnt from(
 select TA.task_key, TA.task_wh_type,TA.task_attribute_wh_name ,TA.task_attribute_wh_new_value,TA.task_attribute_wh_old_value,
 (CASE WHEN TA.task_key IS NULL THEN 'N' ELSE 'Y' END), TRGT.rescheduled_flag
 FROM  <<tenant>>_mdsdb.change_request_final SRC
 inner JOIN  <<tenant>>_mdwdb.d_change_request TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id 
LEFT JOIN  <<tenant>>_mdwdb.f_t_task_activity TA 
ON TA.task_key= TRGT.row_key 
where  TA.task_wh_type = 'change_request'
AND TA.task_attribute_wh_name = 'end_date'
AND  TA.task_attribute_wh_new_value <> TA.task_attribute_wh_old_value 
and (CASE WHEN TA.task_key IS NULL THEN 'N' ELSE 'Y' END)<> TRGT.rescheduled_flag
)h
)e