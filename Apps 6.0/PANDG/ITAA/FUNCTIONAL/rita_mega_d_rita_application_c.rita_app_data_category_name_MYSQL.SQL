SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_app_data_category_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,GROUP_CONCAT(DISTINCT DATA_CAT_NAME ORDER BY DATA_CAT_NAME) AS DATA_CAT_NAME, cdctype
FROM 
(
SELECT a.NAME,a.sourceinstance,DATA_CAT_NAME,a.cdctype
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN 
(
SELECT APP_HEXID,sourceinstance,DATA_CAT_NAME,Count(1)
FROM png_mdsdb.pg_mega_pgv_app_data_cat_final where 
(app_hexid IS NOT NULL AND DATA_CAT_HEXID IS NOT NULL AND DATA_CAT_HEXID <>'' AND cdctype='X')
group by 1,2,3
) CAT ON a.NAME=CAT.app_hexid AND a.sourceinstance=CAT.sourceinstance
) X 
GROUP BY NAME 
) SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.DATA_CAT_NAME,'UNSPECIFIED')<>TRGT.rita_app_data_category_name
AND SRC.cdctype='X'
) temp;


