SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.priority_escalated_flag' ELSE 'SUCCESS' END as Message
 from ibmwatson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN ibmwatson_mdwdb.d_case TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id)
 left join ibmwatson_mdwdb.f_case F
 ON (F.row_id  =SRC.sys_id  
 AND F.source_id=SRC.sourceinstance)
 left join (
 select row_key, case_key, TA.task_attribute_wh_new_value, TA.task_attribute_wh_old_value,
 (case when TA.task_attribute_wh_old_value IS NOT NULL AND TA.task_attribute_wh_new_value IS NOT NULL   
AND  TA.task_attribute_wh_new_value < TA.task_attribute_wh_old_value
THEN 1 ELSE 0 END) AS priority_escalated
 from ibmwatson_mdwdb.f_case_activity TA 
 where TA.task_wh_type = 'SN_CUSTOMERSERVICE_CASE' 
 AND TA.task_attribute_wh_name =  'priority'
 group by row_key, case_key, TA.task_attribute_wh_new_value, TA.task_attribute_wh_old_value
 ) SRCF
 on F.case_key = SRCF.case_key
  WHERE TRGT.row_key not in (0, -1) and 
COALESCE(COALESCE(priority_escalated_flag,CASE WHEN SRCF.priority_escalated>=0 THEN 'Y' ELSE 'N' END) ,'')
 <> COALESCE(TRGT.priority_escalated_flag ,'')
