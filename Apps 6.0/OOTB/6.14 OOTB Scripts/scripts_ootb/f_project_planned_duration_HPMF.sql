SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.planned_duration' ELSE 'SUCCESS' END as Message
FROM (select * from    #MDS_TABLE_SCHEMA.hp_pm_projects_final SRC where cdctype <> 'D') SRC
left join (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT
on TRGT.row_id = SRC.project_id 
and TRGT.source_id = SRC.sourceinstance
left join
(select count(*) as planned,TRGT1.row_id, TRGT1.planned_duration, TRGT1.planned_start_on,TRGT1.planned_end_on
 from (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT1
LEFT JOIN (
 select source_id,max(lastupdated) as refresh from   #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT1.source_id = df.source_id )
left join(select * from  #DWH_TABLE_SCHEMA.d_calendar_date)LKP
on LKP.calendar_date between TRGT1.planned_start_on and COALESCE(TRGT1.planned_end_on,df.refresh)
and LKP.week_day_flag = 'Y' AND LKP.calendar_code = 0
group by TRGT1.row_key)SRC10
on TRGT.row_id=SRC10.row_id
WHERE COALESCE(SRC10.planned,0)<>round(COALESCE(TRGT.planned_duration,0),0)