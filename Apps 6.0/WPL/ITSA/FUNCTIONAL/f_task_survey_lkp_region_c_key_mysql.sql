SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_survey.lkp_region_c_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  wpl_mdwdb.f_task_survey ts
JOIN wpl_mdsdb.asmt_assessment_instance_final tsd 
ON ts.row_id=tsd.sys_id and ts.source_id=tsd.sourceinstance
LEFT JOIN wpl_mdsdb.task_final tf 
on tf.sys_id = tsd.u_parent_ticket
JOIN wpl_mdwdb.d_lov LKP
ON LKP.row_id = COALESCE(CONCAT('LKP_REGION_C~INCIDENT~~~',UPPER(tf.u_lkp_region)),'UNSPECIFIED') 
AND LKP.source_id =  tsd.sourceinstance 
-- AND DATE_FORMAT(ts.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to  
WHERE COALESCE(LKP.row_key,CASE WHEN COALESCE(tf.u_lkp_region,'UNSPECIFIED') IS NULL THEN 0 else '-1' end)<> COALESCE(ts.lkp_region_c_key,'')
  and tf.CDCTYPE<>'D'
  )x
  
  
  
 