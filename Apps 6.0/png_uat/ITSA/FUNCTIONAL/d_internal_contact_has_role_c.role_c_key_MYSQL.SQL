SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact_has_role_c.role_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.sys_user_has_role_final SRC 
LEFT JOIN png_mdwdb.d_internal_contact_has_role_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_internal_contact LKP ON COALESCE(SRC.role,'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.role IS NULL THEN 0 ELSE -1 END)<>TRGT.role_c_key
AND SRC.cdctype='X'
) temp;


