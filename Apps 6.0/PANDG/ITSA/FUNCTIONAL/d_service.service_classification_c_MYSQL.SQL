SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_service.service_classification_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM pandg_mdsdb.cmdb_ci_service_final SRC 
JOIN pandg_mdwdb.d_service TRGT ON COALESCE(CONCAT('BUSINESS_SERVICE~',SRC.sys_id),'UNSPECIFIED')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.service_classification,'UNSPECIFIED')<>TRGT.service_classification_c
) temp;



