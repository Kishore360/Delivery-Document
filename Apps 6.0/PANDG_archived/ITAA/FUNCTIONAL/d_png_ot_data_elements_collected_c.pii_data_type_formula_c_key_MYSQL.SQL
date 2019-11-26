SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_data_elements_collected_c.pii_data_type_formula_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_data_elements_map_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_data_elements_collected_c TRGT ON sha1(lower(SRC.data_element))=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON COALESCE(CONCAT('PII_DATA_TYPE_FORMULA_C~PROCESSING_ACTIVITIES~',SRC.pii_data_type_label),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.pii_data_type_label IS NULL THEN 0 ELSE -1 END)<>TRGT.pii_data_type_formula_c_key
AND SRC.cdctype='X'
) temp;


