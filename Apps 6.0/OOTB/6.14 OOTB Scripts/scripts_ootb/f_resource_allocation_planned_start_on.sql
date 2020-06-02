
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.planned_start_on' ELSE 'SUCCESS' END as Message
   FROM (select S.*,cd.calendar_date  from ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_allocation_final WHERE CDCTYPE<>'D') S 
JOIN #DWH_TABLE_SCHEMA.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y') SRC
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_plan_final WHERE CDCTYPE<>'D')  RP        
ON SRC.resource_plan = RP.sys_id   AND   SRC.sourceinstance = RP.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_resource_allocation TRGT 
ON (concat(SRC.sys_id,'~', date_format(SRC.calendar_date,'%Y%m%d'))  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
WHERE RP.start_date <> TRGT.planned_start_on 