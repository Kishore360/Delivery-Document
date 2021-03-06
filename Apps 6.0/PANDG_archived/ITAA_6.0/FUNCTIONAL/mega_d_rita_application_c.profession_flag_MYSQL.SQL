SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.profession_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,GROUP_CONCAT(DISTINCT ATTRIBUTE_NAME ORDER BY ATTRIBUTE_NAME) AS ATTRIBUTE_NAME
FROM 
(
SELECT app.NAME,app.sourceinstance,app.cdctype,ATT.ATTRIBUTE_NAME
FROM png_mdsdb.pg_mega_pgb_application_rita_final as app 
LEFT JOIN 
(
SELECT a.app_hex,a.sourceinstance,a.ATTRIBUTE_NAME,count(1) 
FROM png_mdsdb.pg_mega_pgv_application_data_model_final a
JOIN png_mdsdb.pg_ot_data_elements_map_final b ON a.ATTRIBUTE_NAME=b.data_element AND a.sourceinstance=b.sourceinstance
where a.app_hex  IS NOT NULL and a.ATTRIBUTE_NAME IS NOT NULL AND a.cdctype='X'
group by 1,2,3
) AS ATT ON app.NAME=ATT.app_hex AND app.sourceinstance=ATT.sourceinstance AND app.cdctype='X'
) Y 
Group BY NAME
) SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND TRGT.soft_deleted_flag='N'
WHERE (CASE WHEN SRC.ATTRIBUTE_NAME like '%Profession%' THEN 'Y' ELSE 'N' END)<>TRGT.profession_flag
)temp;







