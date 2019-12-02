SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_survey.task_c_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  wpl_mdwdb.f_task_survey ts
JOIN wpl_mdsdb.asmt_assessment_instance_final tsd 
ON ts.row_id=tsd.sys_id and ts.source_id=tsd.sourceinstance
LEFT JOIN wpl_mdsdb.task_final tf 
on tf.sys_id = tsd.u_parent_ticket
join wpl_mdwdb.d_task LKP
on LKP.row_id = COALESCE(tf.sys_id,'UNSPECIFIED')
and LKP.source_id=tf.sourceinstance
WHERE COALESCE(LKP.row_key,CASE WHEN tf.sys_id is null THEN 0 else -1 end) <> (ts.task_c_key)
  and tf.CDCTYPE<>'D'
  )x
  
  
  
 