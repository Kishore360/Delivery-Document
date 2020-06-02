
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.loc_currency_code' ELSE 'SUCCESS' END as Message
 FROM (select S.*,cd.calendar_date  from ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_allocation_final WHERE CDCTYPE<>'D') S 
JOIN #DWH_TABLE_SCHEMA.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y') SRC
LEFT JOIN ( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and field='ALLOCATED_COST' and (id is not null) group by id, sys_created_on,field)) FX1  
ON (FX1.id = SRC.sys_id 
AND FX1.sourceinstance = SRC.sourceinstance 
AND FX1.field = 'ALLOCATED_COST')
LEFT JOIN #DWH_TABLE_SCHEMA.f_resource_allocation TRGT 
ON (concat(SRC.sys_id,'~', date_format(SRC.calendar_date,'%Y%m%d'))  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( FX1.currency ,'')<> COALESCE(TRGT.loc_currency_code ,'')
