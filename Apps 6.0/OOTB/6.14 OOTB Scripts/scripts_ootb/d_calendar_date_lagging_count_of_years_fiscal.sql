SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.lagging_count_of_year' ELSE 'SUCCESS' END as Message
FROM  
(SELECT * FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') tgt,
(
select distinct src1.calendar_date, src1.rolling_count_of_year 
from (SELECT * FROM #DWH_TABLE_SCHEMA.d_calendar_date WHERE calendar_name <> 'Greogrian Calendar') src1 join
(SELECT DATE(MAX(lastupdated)) AS last_upd  FROM #STG_TABLE_SCHEMA.o_data_freshness) t
on src1.calendar_date = t.last_upd
) src
where (src.rolling_count_of_year-tgt.rolling_count_of_year) <> tgt.lagging_count_of_year