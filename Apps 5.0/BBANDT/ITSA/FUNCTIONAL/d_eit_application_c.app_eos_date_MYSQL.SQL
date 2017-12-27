
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.app_eos_date' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM bbandt_mdsdb.us_technical_health_check_c_final SRC 
JOIN bbandt_mdwdb.d_eit_application_c TRGT ON (SRC.row_id and TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where CONVERT_TZ (SRC.app_eos_date,'GMT','America/New_York')<>TRGT.app_eos_date
)temp;