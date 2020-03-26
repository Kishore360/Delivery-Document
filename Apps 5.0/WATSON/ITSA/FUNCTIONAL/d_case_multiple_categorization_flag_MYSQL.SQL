
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.multiple_categorization_flag' ELSE 'SUCCESS' END
 FROM watson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN watson_mdwdb.d_case TRGT 
 ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN 
 (select case_key,source_id,task_wh_type,task_attribute_wh_name, soft_deleted_flag,
 CASE WHEN task_attribute_wh_name =  'category' AND task_attribute_wh_old_value IS NOT NULL AND task_attribute_wh_new_value IS NOT NULL   
 and  task_attribute_wh_new_value <> task_attribute_wh_old_value  THEN 'Y' ELSE 'N' END multiple_categorization
 from  watson_mdwdb.f_case_activity ) TA 
 ON (TRGT.row_key  =TA.case_key   AND TA.source_id=TRGT.source_id ) AND TA.task_wh_type = 'SN_CUSTOMERSERVICE_CASE' 
 AND TA.task_attribute_wh_name =  'category' 
 WHERE TRGT.row_key not in (0, -1) and 
  COALESCE(multiple_categorization_flag ,TA.multiple_categorization) <> COALESCE(TRGT.multiple_categorization_flag ,'') AND SRC.cdctype <>'D'and TRGT.soft_deleted_flag<> 'Y' 
and TA.soft_deleted_flag<>'Y'
