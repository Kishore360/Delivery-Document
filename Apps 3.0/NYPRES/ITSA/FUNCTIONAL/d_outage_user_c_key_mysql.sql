 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.user_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.cmdb_ci_outage_final SRC 
JOIN nypres_mdwdb.d_outage TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN nypres_mdsdb.sys_user_final src1
ON src1.user_name = SRC.sys_created_by AND src1.sourceinstance = SRC.sourceinstance
LEFT JOIN nypres_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',src1.sys_id),'UNSPECIFIED')= LKP.row_id  AND src1.sourceinstance= LKP.source_id   )
 WHERE COALESCE(LKP.row_key,CASE WHEN src1.sys_id IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.user_c_key);
 
 
