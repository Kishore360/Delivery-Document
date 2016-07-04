SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.same_day_last_week_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdwdb.d_calendar_date 
WHERE same_day_last_week_key <> DATE_FORMAT(ADDDATE(calendar_date,INTERVAL -7 DAY), '%Y%m%d')
