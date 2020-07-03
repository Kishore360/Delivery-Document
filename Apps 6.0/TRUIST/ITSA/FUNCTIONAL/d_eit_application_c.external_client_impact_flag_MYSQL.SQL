

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.external_client_impact_flag' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM truist_mdsdb.us_technical_health_check_c_final SRC
JOIN truist_mdwdb.d_eit_application_c TRGT ON (SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
Where (CASE WHEN SRC.external_client_impact='Yes' THEN 'Y' ELSE 'N' END)<>TRGT.external_client_impact_flag
and SRC.cdctype<>'D'
)temp;
