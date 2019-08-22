SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact_role_c.description_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.sys_user_role_final SRC 
LEFT JOIN png_mdwdb.d_internal_contact_role_c TRGT ON SRC.sys_id=TRGT.row_ID AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.description,'UNSPECIFIED')<>TRGT.description_c
AND SRC.cdctype='X'
) temp;


   