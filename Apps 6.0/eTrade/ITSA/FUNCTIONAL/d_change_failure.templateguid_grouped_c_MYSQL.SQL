SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.templateguid_grouped_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
FROM etrade_mdwdb.d_change_failure SRC 
JOIN etrade_mdwdb.d_predictor_variable_c SRC1 ON COALESCE(SRC.templateguid_c,'UNSPECIFIED')=SRC1.value_c
AND SRC.source_id=SRC1.source_id AND SRC1.predictor_variable_c='TemplateGUID'
WHERE COALESCE(SRC1.grouped_value_c,'num_grouped_others')<>SRC.templateguid_grouped_c
) temp; 





  