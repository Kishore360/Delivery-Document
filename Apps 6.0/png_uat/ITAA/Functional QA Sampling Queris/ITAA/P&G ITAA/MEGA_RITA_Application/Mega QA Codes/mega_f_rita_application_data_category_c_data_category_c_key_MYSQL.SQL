SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_data_category_c_data_category_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(SELECT a.APP_HEXID,a.sourceinstance,a.DATA_CAT_HEXID AS DATA_CAT_HEXID,
a.DATA_CAT_NAME AS DATA_CAT_NAME FROM 
pandg_mdsdb.pg_mega_pgv_app_data_cat_final a group by 1,2) SRC1 ON SRC.NAME=SRC1.APP_HEXID AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN pandg_mdwdb.f_rita_application_data_category_c TRGT ON 
CONCAT(SRC1.APP_HEXID,'~',COALESCE(SRC1.DATA_CAT_HEXID,'UNSPECIFIED')=TRGT.row_id
AND SRC1.sourceinstance=TRGT.source_id)
JOIN pandg_mdwdb.d_data_category_c LKP ON SRC1.DATA_CAT_HEXID = LKP.row_id AND SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.DATA_CAT_NAME IS NULL THEN 0 ELSE -1 END)<>TRGT.data_category_c_key

) temp;

