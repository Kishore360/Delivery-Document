SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_predictor_variable_c.grouped_value_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM etrade_mdsdb.us_hlx_predictor_variable_c_final SRC 
LEFT JOIN etrade_mdwdb.d_predictor_variable_c TRGT ON SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC.grouped_value<>TRGT.grouped_value_c
AND SRC.cdctype='X'
) temp; 


 