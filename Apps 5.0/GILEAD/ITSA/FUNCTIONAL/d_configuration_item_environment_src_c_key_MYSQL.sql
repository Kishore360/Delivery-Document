
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as cnt 
FROM gilead_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN gilead_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN gilead_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('U_ENVIRONMENT_C~CONFIGURATION_ITEM','~~~',UPPER(SRC.u_environment)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_environment IS NULL THEN 0 else -1 end)<> (TRGT.environment_src_c_key) and SRC.cdctype='X')temp;