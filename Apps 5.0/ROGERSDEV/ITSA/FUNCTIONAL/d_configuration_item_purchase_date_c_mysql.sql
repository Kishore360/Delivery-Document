SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_change_request.sub_status_src_c_key' ELSE 'SUCCESS' END as Message 
 FROM rogersdev_mdsdb.cmdb_ci_appl_final  SRC 
JOIN rogersdev_mdwdb.d_configuration_item TRGT 
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
  WHERE CONVERT_TZ(src.purchase_date,'GMT','America/New_York')<> (TRGT.purchase_date_c) 


