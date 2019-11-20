SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_data_elements_collected_c.data_element_collected' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_data_elements_map_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_data_elements_collected_c TRGT ON sha1(lower(SRC.data_element))=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.data_element,'UNSPECIFIED')<>TRGT.data_element_collected
AND SRC.cdctype='X'
) temp;


