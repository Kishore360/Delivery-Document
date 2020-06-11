SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for fiscal d_calendar_date.previous_period_date' ELSE 'SUCCESS' END as Message
FROM  
(
select distinct  src.calendar_date, src1.rolling_count_of_period, src1.period_start_date AS src_previous_period_date
from
(SELECT calendar_date, rolling_count_of_period, period_start_date FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src
LEFT OUTER JOIN
(SELECT distinct calendar_date, rolling_count_of_period, period_start_date
FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src1
ON ((src.rolling_count_of_period-1)=src1.rolling_count_of_period)
) SRC_1
Left outer join #DWH_TABLE_SCHEMA.d_calendar_date tgt
on tgt.calendar_date = SRC_1.calendar_date
WHERE SRC_1.src_previous_period_date <> tgt.previous_period_date 