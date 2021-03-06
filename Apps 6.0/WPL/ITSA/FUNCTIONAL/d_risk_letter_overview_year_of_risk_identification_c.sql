
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_risk_letter_overview.year_of_risk_identification_c' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM wpl_mdsdb.us_rlo_history_final SRC 
LEFT JOIN wpl_mdwdb.d_risk_letter_overview TRGT ON     concat(COALESCE(src.risknumber,'UNSPECIFIED'), '~', REPLACE(COALESCE(src.monthyear,'UNSPECIFIED'),'-','') )=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE SRC.cdctype<>'D' and SRC.yearofriskidentificationformula<>TRGT.year_of_risk_identification_c 
) temp; 




 