SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_application_schedule_c_start_time' ELSE 'SUCCESS' END as Message 
FROM (SELECT Count(1) as CNT 
FROM bbandt_mdsdb.us_application_schedule_c_final SRC
JOIN bbandt_mdwdb.d_application_schedule_c TRGT ON (SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE str_to_date(concat('1970-01-01 ',SRC.start_time),'%Y-%m-%d %H:%i:%S') <>TRGT.start_time
and SRC.cdctype='X'
)temp; 