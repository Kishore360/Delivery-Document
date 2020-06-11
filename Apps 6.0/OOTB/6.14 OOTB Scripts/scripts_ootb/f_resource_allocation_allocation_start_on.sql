
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.allocation_start_on' ELSE 'SUCCESS' END as Message
FROM (select S.*,cd.calendar_date,cd.calendar_date as allocation_start_on
from ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_allocation_final WHERE CDCTYPE<>'D') S 
JOIN #DWH_TABLE_SCHEMA.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y' AND  cd.source_id=0) SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_resource_allocation TRGT 
ON (concat(SRC.sys_id,'~', date_format(SRC.calendar_date,'%Y%m%d'))  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE COALESCE(date_format(SRC.allocation_start_on,'%Y%m%d'),'')<> COALESCE(date_format(TRGT.allocation_start_on,'%Y%m%d'),'')
 