SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.previous_week_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdwdb.d_calendar_date a  JOIN (SELECT DISTINCT week_start_date_key,rolling_count_of_weeks,calendar_code FROM <<tenant>>_mdwdb.d_calendar_date)b 
 ON a.rolling_count_of_weeks=b.rolling_count_of_weeks+1 
 AND a.calendar_code=b.calendar_code  
 WHERE a.previous_week_key <> b.week_start_date_key
 
