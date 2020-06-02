-- disabling the script as it fails for calender type where weeks will be counted from last week of last year if the days are reamining after complete week

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.previous_week_key' ELSE 'SUCCESS' END as Message
 FROM #DWH_TABLE_SCHEMA.d_calendar_date a  
 JOIN 
 (SELECT DISTINCT week_start_date,rolling_count_of_weeks,calendar_code,calendar_date FROM #DWH_TABLE_SCHEMA.d_calendar_date)b 
 ON a.calendar_date=b.calendar_date+7 
 AND a.calendar_code=b.calendar_code and a.calendar_code=0
 WHERE a.previous_week_date <> b.calendar_date