


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_site_c_countries_collected_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hex AS app_hex,a.sourceinstance,a.site_hex AS site_hex,a.SITE_NAME AS SITE_NAME
FROM pandg_mdsdb.pg_mega_pgv_application_site_pii_final a where a.app_hex is not null and a.site_hex is not null and a.site_hex<>'' and a.cdctype='X'
GROUP BY 1,2) 
SRC1 ON SRC.NAME=SRC1.app_hex AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN pandg_mdwdb.f_rita_application_site_c TRGT ON CONCAT(SRC.NAME,'~',COALESCE(SRC1.site_hex,'UNSPECIFIED'))=TRGT.row_id AND
 SRC.sourceinstance=TRGT.source_id
JOIN pandg_mdwdb.d_site_c LKP ON COALESCE(SRC1.site_hex,'UNSPECIFIED')=LKP.row_id AND SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.SITE_NAME IS NULL THEN 0 ELSE -1 END)<>TRGT.countries_collected_c_key
) temp;




