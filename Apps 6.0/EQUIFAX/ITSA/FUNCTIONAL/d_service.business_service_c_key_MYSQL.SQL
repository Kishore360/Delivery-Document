


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_service.business_service_c_key' ELSE 'SUCCESS' END as Message
FROM
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.cmdb_ci_service_final SRC 
LEFT JOIN equifax_mdwdb.d_service TRGT ON SRC.sys_id=RIGHT(TRGT.row_id,32) AND SRC.sourceinstance=TRGT.source_id
JOIN equifax_mdwdb.d_service LKP ON SRC.sys_id=RIGHT(LKP.row_id,32) AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.name IS NULL THEN 0 ELSE -1 END)<>TRGT.row_key and SRC.cdctype<>'D'
) temp;


