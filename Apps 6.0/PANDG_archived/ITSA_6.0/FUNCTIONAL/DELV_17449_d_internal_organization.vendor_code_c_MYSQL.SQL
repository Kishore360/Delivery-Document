SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.vendor_code_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.core_company_final SRC 
LEFT JOIN png_mdwdb.d_internal_organization TRGT ON SRC.sys_id=RIGHT(TRGT.row_id,32) AND SRC.sourceinstance=TRGT.source_id 
WHERE COALESCE(SRC.u_pg_vendor,'')<>TRGT.vendor_code_c
AND SRC.cdctype='X'
) temp;


