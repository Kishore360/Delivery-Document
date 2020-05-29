SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for fiscal d_calendar_date.period_end_date' ELSE 'SUCCESS' END as Message
FROM  
(
select distinct src.calendar_date, src1.src_period_end_date
from
(SELECT calendar_date, period_id FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src
LEFT OUTER JOIN
(SELECT  period_id, max(calendar_date) src_period_end_date
FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar'
group by period_id) src1
ON (src1.period_id=src.period_id)
) SRC_1
Left outer join 
(SELECT * FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') tgt
on tgt.calendar_date = SRC_1.calendar_date
WHERE SRC_1.src_period_end_date <> tgt.period_end_date 