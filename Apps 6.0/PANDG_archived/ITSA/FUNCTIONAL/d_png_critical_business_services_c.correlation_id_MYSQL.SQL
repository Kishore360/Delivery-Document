SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_critical_business_services_c.correlation_id' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_ci_business_services_final SRC 
LEFT JOIN png_mdwdb.d_png_critical_business_services_c TRGT ON SRC.correlation_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.correlation_id,'UNSPECIFIED')<>TRGT.correlation_id
AND SRC.cdctype='X'
) temp;
 
 
  
  
 