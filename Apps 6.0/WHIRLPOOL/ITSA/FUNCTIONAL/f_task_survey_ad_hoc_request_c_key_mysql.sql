SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_survey.ad_hoc_request_c_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  whirlpool_mdwdb.f_task_survey ts
JOIN whirlpool_mdsdb.asmt_assessment_instance_final tsd 
ON ts.row_id=tsd.sys_id and ts.source_id=tsd.sourceinstance
LEFT JOIN whirlpool_mdsdb.task_final tf 
on tf.sys_id = tsd.u_parent_ticket
JOIN whirlpool_mdwdb.d_ad_hoc_request_c LKP
ON LKP.row_id =  case when upper(tsd.trigger_table) = 'U_AD_HOC_REQUEST' then COALESCE(tsd.trigger_id,'UNSPECIFIED') else 'UNSPECIFIED' end  
AND LKP.source_id =  tsd.sourceinstance 
-- AND DATE_FORMAT(ts.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to  
WHERE COALESCE(LKP.row_key,CASE WHEN COALESCE(tsd.trigger_id,'UNSPECIFIED') IS NULL THEN 0 else '-1' end)= COALESCE(ts.ad_hoc_request_c_key,'')
  and tf.CDCTYPE<>'D'
  )x
  
  
  
 