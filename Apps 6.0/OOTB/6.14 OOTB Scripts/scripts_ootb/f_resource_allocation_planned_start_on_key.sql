
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.planned_start_on_key' ELSE 'SUCCESS' END as Message
FROM (select S.*,cd.calendar_date  from ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_allocation_final WHERE CDCTYPE<>'D') S 
JOIN #DWH_TABLE_SCHEMA.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y') SRC
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_plan_final WHERE CDCTYPE<>'D')  RP        
ON SRC.resource_plan = RP.sys_id   AND   SRC.sourceinstance = RP.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_resource_allocation TRGT 
ON (concat(SRC.sys_id,'~', date_format(SRC.calendar_date,'%Y%m%d'))  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
 ON ( date_format(RP.start_date,'%Y%m%d') = LKP.row_id 
AND 0= LKP.source_id )

 WHERE COALESCE(LKP.row_key,CASE WHEN RP.start_date IS NULL THEN '' else '' end)<> COALESCE(TRGT.planned_start_on_key,'')
