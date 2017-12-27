 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_technical_health_check_c.eit_application_c_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM bbandt_mdsdb.us_technical_health_check_c_final SRC 
JOIN bbandt_mdwdb.f_technical_health_check_c TRGT ON (SRC.row_id and TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(SRC.row_id,CASE WHEN SRC.row_id is NULL THEN 0 ELSE -1 END)<>TRGT.eit_application_c_key;
)temp;