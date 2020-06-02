SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for fiscal d_calendar_date.quarter_start_date' ELSE 'SUCCESS' END as Message
FROM  
(
select src.calendar_date, src1.rolling_count_of_quarter, src1.q_start_date AS src_quarter_start_date
from
(SELECT calendar_date, rolling_count_of_quarter FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src
LEFT OUTER JOIN
(SELECT  rolling_count_of_quarter, min(calendar_date) as q_start_date
FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar'
group by rolling_count_of_quarter) src1
ON (src.rolling_count_of_quarter=src1.rolling_count_of_quarter)
) SRC_1
Left outer join
(SELECT * FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') tgt
on tgt.calendar_date = SRC_1.calendar_date
WHERE SRC_1.src_quarter_start_date <> tgt.quarter_start_date 
