
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.application_elopment_prime_c_key' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdsdb.cmdb_ci_appl_final  SRC 
JOIN rogers6_mdwdb.d_application TRGT 
ON (concat('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN rogers6_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_development_director),'UNSPECIFIED') = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_development_director IS NULL THEN 0 else -1 end)<>
 (TRGT.application_development_director_c_key) 
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N'



