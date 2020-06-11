SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.allocated_hours' ELSE 'SUCCESS' END as Message
/*select SRC.allocated_hours, TRGT.allocated_hours,
TRGT.planned_hours*week_day_count*/
from 
(
select S.*,cd.calendar_date  from ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_allocation_final WHERE CDCTYPE<>'D') S 
JOIN #DWH_TABLE_SCHEMA.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y' and cd.calendar_code=0) SRC
INNER JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_plan_final WHERE CDCTYPE<>'D')  RP       
ON SRC.resource_plan = RP.sys_id   AND   SRC.sourceinstance = RP.sourceinstance
join #DWH_TABLE_SCHEMA.f_resource_allocation TRGT
on concat(SRC.sys_id,'~', date_format(SRC.calendar_date,'%Y%m%d')) =TRGT.row_id and SRC.sourceinstance = TRGT.source_id
where coalesce(SRC.allocated_hours, 0) <> round(coalesce((TRGT.allocated_hours * TRGT.week_day_count), 0), 2);;