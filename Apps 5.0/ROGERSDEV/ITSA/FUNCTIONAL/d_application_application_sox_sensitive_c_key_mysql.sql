SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.application_sox_sensitive_c_key' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.cmdb_ci_appl_final  SRC 
JOIN rogersdev_mdwdb.d_application TRGT 
ON (concat('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN rogersdev_mdwdb.d_lov LKP 
 ON ( COALESCE(CONCAT('SOXSENSITIVE','~','CMDB_CI_APPL','~','~','~',UPPER(SRC.u_sox_sensitive)),'UNSPECIFIED') = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_sox_sensitive IS NULL THEN 0 else -1 end)<> (TRGT.application_sox_sensitive_c_key) 