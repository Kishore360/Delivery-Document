

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.public_internet_facing_flag' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM bbandt_mdsdb.us_technical_health_check_c_final SRC
JOIN bbandt_mdwdb.d_eit_application_c TRGT ON (SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
Where (CASE WHEN SRC.public_internet_facing='Yes' THEN 'Y' ELSE 'N' END)<>TRGT.public_internet_facing_flag
)temp;