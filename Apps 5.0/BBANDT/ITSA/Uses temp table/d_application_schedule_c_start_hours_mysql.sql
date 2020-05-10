SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_application_schedule_c_start_hours' ELSE 'SUCCESS' END as Message 
FROM (SELECT Count(1) as CNT 
FROM bbandt_mdsdb.us_application_schedule_c_final SRC
JOIN bbandt_mdwdb.d_application_schedule_c TRGT ON (SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE RIGHT(CONCAT('0',COALESCE(CASE WHEN SRC.start_time is NULL THEN '0000'
	 WHEN SRC.start_time like '%Business Hours are from%' THEN date_format(str_to_date(
	TRIM(substring_index(replace(SRC.start_time,'Business Hours are from',''),'to',1))
	,'%l:%i %p'),'%H%i')
	WHEN SRC.start_time like '%Business Hours are%' THEN date_format(str_to_date(
	TRIM(substring_index(replace(SRC.start_time,'Business Hours are',''),'to',1)),
	'%l:%i %p'),'%H%i')
	WHEN(SRC.start_time like '%am%' OR SRC.start_time like '%PM%') and SRC.start_time like '%:%' 
    THEN date_format(str_to_date(SRC.start_time,'%l:%i %p'),'%H%i')
	WHEN (SRC.start_time like '%am%' OR SRC.start_time like '%PM%') THEN date_format(str_to_date(SRC.start_time,'%l %p'),'%H%i')
	 WHEN SRC.start_time like '%n%a%' THEN '0000'
	 WHEN SRC.start_time like '12:00:00 AM' THEN '0000'
	 WHEN SRC.start_time like '%:%' THEN LEFT(REPLACE(SRC.start_time,':',''),4)
	 WHEN SRC.start_time like '%;%' THEN LEFT(REPLACE(SRC.start_time,';',''),4)
	 WHEN length(TRIM(SRC.start_time)) =3 THEN CONCAT('0',SRC.start_time)
	 WHEN length(TRIM(SRC.start_time)) =4 THEN SRC.start_time
	ELSE '0000' END,'0000')),4) <>TRGT.start_hours
)temp; 