SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_application_schedule_c_day_of_week' ELSE 'SUCCESS' END as Message 
FROM (SELECT Count(1) as CNT 
FROM bbandt_mdsdb.us_application_schedule_c_final SRC
JOIN bbandt_mdwdb.d_application_schedule_c TRGT ON (SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.day_of_week,'UNSPECIFIED')<>COALESCE(TRGT.day_of_week,'UNSPECIFIED')
)temp; 