SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.planned_percent_complete' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_pm_projects_final SRC where cdctype <> 'D') SRC
LEFT JOIN(select * from   #DWH_TABLE_SCHEMA.f_project)TRGT
on TRGT.row_id = SRC.project_id 
and TRGT.source_id = SRC.sourceinstance
left join(select * from  #DWH_TABLE_SCHEMA.d_lov_map)LKP1
on TRGT.project_state_src_key=LKP1.src_key
and TRGT.source_id=LKP1.source_id
left join
(select count(*) as actual,TRGT1.row_id, TRGT1.planned_duration,df.refresh,TRGT1.planned_start_on,TRGT1.planned_end_on
 from (select * from   #DWH_TABLE_SCHEMA.f_project)TRGT1
LEFT JOIN (
 select source_id,max(lastupdated) as refresh from #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT1.source_id = df.source_id )
inner join(select * from   #DWH_TABLE_SCHEMA.d_calendar_date)LKP
on LKP.calendar_date between (CASE WHEN  DATE_FORMAT (COALESCE(TRGT1.actual_start_on,
                TRGT1.planned_start_on),
                '%H-%i-%s') <  '17-00-00' THEN  CAST(COALESCE(TRGT1.actual_start_on,
                TRGT1.planned_start_on)AS DATE) 
                ELSE CAST(DATE_ADD(COALESCE(TRGT1.actual_start_on,
                TRGT1.planned_start_on),
                INTERVAL 1 DAY)AS DATE ) END ) and df.refresh
and LKP.week_day_flag = 'Y' AND LKP.calendar_code = 0
group by TRGT1.row_key)SRC10
on TRGT.row_id=SRC10.row_id
WHERE LKP1.dimension_wh_code NOT IN ('CLOSED') and case when SRC10.refresh < SRC10.planned_start_on then 0
 when SRC10.refresh> SRC10.planned_end_on then 1
 else round((SRC10.actual/SRC10.planned_duration)) END <> round(COALESCE(TRGT.planned_percent_complete,''),0)
                


