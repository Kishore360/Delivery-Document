SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.week_day_count' ELSE 'SUCCESS' END as Message
FROM (select * from      #MDS_TABLE_SCHEMA.hp_wp_tasks_final where cdctype <> 'D') SRC
left join(select * from   #DWH_TABLE_SCHEMA.f_project_task)TRGT
on TRGT.row_id = SRC.task_id 
and TRGT.source_id = SRC.sourceinstance
left join
(select count(*) as weekdaycount,TRGT1.row_id, refresh
 from (select * from   #DWH_TABLE_SCHEMA.f_project_task)TRGT1
LEFT JOIN (
 select source_id,max(lastupdated) as refresh from    #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT1.source_id = df.source_id )
inner join(select * from   #DWH_TABLE_SCHEMA.d_calendar_date)LKP
on LKP.calendar_date between (CASE WHEN DATE_FORMAT(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on), '%H-%i-%s') < '17-00-00' THEN 
  CAST(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on) AS DATE)
 ELSE 
  CAST(DATE_ADD(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on), INTERVAL 1 DAY) AS DATE) 
 END ) and df.refresh
and LKP.week_day_flag = 'Y' AND LKP.calendar_code = 0
group by TRGT1.row_key)SRC10
on TRGT.row_id=SRC10.row_id
left join (select * from #DWH_TABLE_SCHEMA.d_lov_map)LKP1
on TRGT.project_task_state_src_key=LKP1.src_key
WHERE  LKP1.dimension_wh_code NOT IN ('CLOSED') 
and  COALESCE(SRC10.weekdaycount,0)<>COALESCE(TRGT.week_day_count,0)

