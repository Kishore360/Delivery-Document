SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for fiscal d_calendar_date.week_end_date_of_quarter' ELSE 'SUCCESS' END as Message
FROM  
(
select distinct src.calendar_date, src1.src_week_end_date AS src_week_end_date
from
(SELECT calendar_date, rolling_count_of_weeks, week_start_date FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src
LEFT OUTER JOIN
(SELECT  rolling_count_of_weeks, max(calendar_date) src_week_end_date
FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar'
group by rolling_count_of_weeks) src1
ON (src1.rolling_count_of_weeks=src.rolling_count_of_weeks)
) SRC_1
Left outer join 
(SELECT * FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') tgt
on tgt.calendar_date = SRC_1.calendar_date
WHERE SRC_1.src_week_end_date <> tgt.week_end_date_of_quarter 