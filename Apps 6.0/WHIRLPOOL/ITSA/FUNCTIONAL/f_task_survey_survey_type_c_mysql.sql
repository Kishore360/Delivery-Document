SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_survey.survey_type_c' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  whirlpool_mdwdb.f_task_survey ts
JOIN whirlpool_mdsdb.asmt_assessment_instance_final tsd 
ON ts.row_id=tsd.sys_id and ts.source_id=tsd.sourceinstance
LEFT JOIN whirlpool_mdsdb.task_final tf 
on tf.sys_id = tsd.u_parent_ticket
WHERE 'Assessment' <> ts.survey_type_c
  and tf.CDCTYPE<>'D'
  )x
  
  
  
 