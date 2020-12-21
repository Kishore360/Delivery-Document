SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_data_category_c.data_category_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM pandg_mdsdb.pg_mega_pgv_app_data_cat_final SRC 
LEFT JOIN pandg_mdwdb.d_data_category_c TRGT ON SRC.DATA_CAT_HEXID = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  COALESCE(SRC.DATA_CAT_NAME,'UNSPECIFIED')<> TRGT.data_category_name
) temp;




 
 
 
 