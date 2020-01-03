SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_problem.svp_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT from discover_mdsdb.sys_user_group_final  SRC 
JOIN discover_mdwdb.d_internal_organization TRGT ON (CONCAT('GROUP~',SRC.sys_id)= TRGT.row_id AND SRC.sourceinstance = TRGT.source_id)  
LEFT JOIN discover_mdwdb.d_internal_contact LKP ON ( concat( 'INTERNAL_CONTACT~' , SRC.u_svp) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_svp IS NULL THEN 0 else -1 end)<>(TRGT.svp_c_key)
AND SRC.cdctype='X'
) temp;
