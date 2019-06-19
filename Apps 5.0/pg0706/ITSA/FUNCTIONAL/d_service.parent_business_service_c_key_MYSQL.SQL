SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_service.parent_business_service_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_service_final SRC 
JOIN png_mdwdb.d_service TRGT ON (COALESCE(CONCAT('BUSINESS_SERVICE~',SRC.sys_id),'UNSPECIFIED')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_service LKP ON COALESCE(CONCAT('BUSINESS_SERVICE~',SRC.parent),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END)<>TRGT.parent_business_service_c_key
) temp;





