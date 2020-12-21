


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_site_c.site_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) 
FROM png_mdsdb.pg_mega_pgv_application_site_pii_final SRC 
LEFT JOIN png_mdwdb.d_site_c TRGT ON SRC.SITE_HEX=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.SITE_NAME,'UNSPECIFIED')<>TRGT.site_name
) temp;




 
 
 
 
 