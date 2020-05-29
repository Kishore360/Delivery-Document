SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for fiscal d_calendar_date.year_end_date' ELSE 'SUCCESS' END as Message
FROM  
(
select distinct src.calendar_date, src1.src_year_end_date AS src_year_end_date
from
(SELECT calendar_date, rolling_count_of_year, year_start_date FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src
LEFT OUTER JOIN
(SELECT  rolling_count_of_year, max(calendar_date) src_year_end_date
FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar'
group by rolling_count_of_year) src1
ON (src1.rolling_count_of_year=src.rolling_count_of_year)
) SRC_1
Left outer join 
(SELECT * FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') tgt
on tgt.calendar_date = SRC_1.calendar_date
WHERE SRC_1.src_year_end_date <> tgt.year_end_date 