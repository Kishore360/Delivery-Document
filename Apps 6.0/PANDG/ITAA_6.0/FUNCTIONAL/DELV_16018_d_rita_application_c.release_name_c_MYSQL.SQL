
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.release_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(
SELECT APP_HEX,sourceinstance,GROUP_CONCAT(distinct RELEASE_NAME ORDER BY DB_NAME) AS RELEASE_NAME
FROM png_mdsdb.pg_mega_snv_app_hierarchy_final where APP_HEX IS NOT NULL and cdctype<>'D'
group by 1,2
) SRC1 ON SRC.NAME=SRC1.APP_HEX AND SRC.sourceinstance=SRC1.sourceinstance 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.RELEASE_NAME,'UNSPECIFIED')<>TRGT.release_name_c
AND SRC.cdctype<>'D'
) temp;




