
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.priority_escalated_flag' ELSE 'SUCCESS' END as Message
 FROM 
 (SELECT SRC.sys_id,SRC.sourceinstance,
 SUM(CASE WHEN TA.task_attribute_wh_old_value IS NOT NULL AND TA.task_attribute_wh_new_value IS NOT NULL   
AND  TA.task_attribute_wh_new_value < TA.task_attribute_wh_old_value
THEN 1 ELSE 0 END) AS priority_escalated
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_item_activity TA 
 ON (SRC.sys_id  =TA.task_row_id  
 AND SRC.sourceinstance = TA.source_id  
 AND TA.task_wh_type = 'sc_req_item' 
AND TA.task_attribute_wh_name =  'priority' )
GROUP BY SRC.sys_id,SRC.sourceinstance
) SRCF

LEFT JOIN <<tenant>>_mdwdb.d_request_item TRGT 
 ON (SRCF.sys_id  =TRGT.row_id  
 AND SRCF.sourceinstance = TRGT.source_id  )

 WHERE COALESCE(CASE WHEN SRCF.priority_escalated>0 THEN 'Y' ELSE 'N' END ,'')
 <> COALESCE(TRGT.priority_escalated_flag ,'')


