SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact_has_role_c.user_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.sys_user_has_role_final SRC 
LEFT JOIN png_mdwdb.d_internal_contact_has_role_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_internal_contact LKP ON COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.user),'UNSPECIFIED')
=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.user IS NULL THEN 0 ELSE -1 END)<>TRGT.user_c_key
AND SRC.cdctype='X'
) temp;


 
  