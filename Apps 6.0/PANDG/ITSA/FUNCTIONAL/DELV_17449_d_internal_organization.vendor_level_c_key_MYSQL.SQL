SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.vendor_level_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.core_company_final SRC 
LEFT JOIN png_mdwdb.d_internal_organization TRGT ON SRC.sys_id=RIGHT(TRGT.row_id,32) AND SRC.sourceinstance=TRGT.source_id 
LEFT JOIN png_mdwdb.d_lov LKP ON CONCAT('LEVEL~VENDOR~',SRC.u_pg_level)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_level IS NULL THEN 0 ELSE -1 END)<>TRGT.vendor_level_c_key
AND SRC.cdctype='X'
) temp;




