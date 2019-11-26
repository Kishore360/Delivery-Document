SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_critical_business_process_c.name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_business_process_final SRC 
LEFT JOIN png_mdwdb.d_critical_business_process_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.name,'UNSPECIFIED')<>TRGT.name
AND SRC.cdctype='X'
) temp;


 
 