SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.warranty_expiration_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC
JOIN png_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE CONVERT_TZ(SRC.warranty_expiration,'GMT','America/New_York')<>TRGT.warranty_expiration_c
) temp;


 