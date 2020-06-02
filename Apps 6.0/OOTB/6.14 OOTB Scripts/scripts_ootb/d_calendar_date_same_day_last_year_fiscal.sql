SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for fiscal d_calendar_date.same_day_last_year' ELSE 'SUCCESS' END as Message
FROM 
(
select src_2.calendar_date, case when src_2.src_same_day_last_year is null then src_3.last_day_year 
else src_2.src_same_day_last_year end as src_same_day_last_year1
from
(
select src.calendar_date, src.rolling_count_of_year, src1.calendar_date as src_same_day_last_year
from
(SELECT calendar_date, rolling_count_of_year, day_of_year FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src
LEFT OUTER JOIN
(SELECT distinct calendar_date, day_of_year, rolling_count_of_year
FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src1
ON (((src.rolling_count_of_year-1)=src1.rolling_count_of_year) and (src.day_of_year=src1.day_of_year))
) src_2
LEFT OUTER JOIN
(SELECT rolling_count_of_year, MAX(calendar_date) as last_day_year FROM #DWH_TABLE_SCHEMA.d_calendar_date 
WHERE calendar_name <> 'Greogrian Calendar' GROUP BY rolling_count_of_year) src_3
on (src_2.rolling_count_of_year-1) = src_3.rolling_count_of_year
) SRC_1
Left outer join 
(SELECT * FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') tgt
on tgt.calendar_date = SRC_1.calendar_date
WHERE SRC_1.src_same_day_last_year1 <> tgt.same_day_last_year 