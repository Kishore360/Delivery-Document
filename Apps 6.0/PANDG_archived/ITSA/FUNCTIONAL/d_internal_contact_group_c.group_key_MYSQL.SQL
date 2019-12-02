SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact_group_c.group_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.sys_user_grmember_final SRC 
LEFT JOIN png_mdwdb.d_internal_contact_group_c TRGT ON CONCAT(COALESCE(SRC.group,'UNSPECIFIED'),'~',COALESCE(SRC.user,'UNSPECIFIED'))=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id
JOIN 
(SELECT a.row_id,a.source_id,MAX(a.row_key) as row_key FROM 
png_mdwdb.d_internal_organization a group by 1,2 ) LKP ON CONCAT('GROUP~',COALESCE(SRC.group,'UNSPECIFIED'))=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.group IS NULL THEN 0 ELSE -1 END)<>TRGT.group_key
AND SRC.cdctype='X'
) temp;


 