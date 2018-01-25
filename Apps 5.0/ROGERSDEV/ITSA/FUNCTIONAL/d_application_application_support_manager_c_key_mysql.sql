SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.application_support_manager_c_key' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.cmdb_ci_appl_final  SRC 
JOIN rogersdev_mdwdb.d_application TRGT 
ON (concat('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN rogersdev_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_support_manager),'UNSPECIFIED') = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_support_manager IS NULL THEN 0 else -1 end)<> (TRGT.application_support_manager_c_key) 