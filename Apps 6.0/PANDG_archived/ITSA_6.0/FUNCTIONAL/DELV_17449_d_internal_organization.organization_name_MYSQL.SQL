SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.organization_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.core_company_final SRC 
LEFT JOIN png_mdwdb.d_internal_organization TRGT ON SRC.sys_id=RIGHT(TRGT.row_id,32) AND SRC.sourceinstance=TRGT.source_id 
WHERE COALESCE(SRC.name,'UNSPECIFIED')<>TRGT.organization_name
AND SRC.cdctype='X'
) temp;



