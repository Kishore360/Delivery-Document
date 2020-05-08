SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.impact_classification_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
 
SELECT Count(1) as CNT 
FROM png_mdsdb.change_request_final SRC 
LEFT JOIN png_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_lov LKP ON (CONCAT('IMPACT_CLASSIFICATION_C','~','CHANGE_REQUEST','~',SRC.u_business_justification)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_business_justification IS NULL THEN 0 ELSE -1 END)<>TRGT.impact_classification_c_key
AND SRC.cdctype='X'
) temp; 

 