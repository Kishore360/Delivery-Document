SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_application_schedule_c_end_time' ELSE 'SUCCESS' END as Message 
FROM (SELECT Count(1) as CNT 
-- select str_to_date(concat('1970-01-01 ',CASE WHEN SRC.end_time = '24:00:00' THEN '23:59:59' ELSE SRC.end_time END),'%Y-%m-%d %H:%i:%S'),SRC.end_time,TRGT.end_time
FROM bbandt_mdsdb.us_application_schedule_c_final SRC
JOIN bbandt_mdwdb.d_application_schedule_c TRGT ON (SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE str_to_date(concat('1970-01-01 ',CASE 
                    WHEN SRC.end_time = '24:00:00' THEN '23:59:59' 
                    ELSE SRC.end_time 
                END),'%Y-%m-%d %H:%i:%S')<>TRGT.end_time
                and SRC.cdctype='X'
)temp; 