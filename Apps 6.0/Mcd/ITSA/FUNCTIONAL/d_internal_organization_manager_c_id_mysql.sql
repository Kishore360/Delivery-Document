SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.manager' ELSE 'SUCCESS' END as Message 
FROM mcd_mdsdb.sys_user_group_final  SRC 
JOIN mcd_mdwdb.d_internal_organization TRGT 
ON (concat('GROUP~',SRC.sys_id) = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN mcd_mdwdb.d_internal_contact LKP 
ON ( concat( 'INTERNAL_CONTACT~' ,upper( SRC.manager)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.manager IS NULL THEN 0 else -1 end)<> (TRGT.manager_c_key) 
