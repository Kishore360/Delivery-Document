SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.created_by' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.core_company_final SRC 
LEFT JOIN png_mdwdb.d_internal_organization TRGT ON SRC.sys_id=RIGHT(TRGT.row_id,32) AND SRC.sourceinstance=TRGT.source_id 
WHERE COALESCE(SRC.sys_created_by,'')<>TRGT.created_by
AND SRC.cdctype='X'
) temp;



