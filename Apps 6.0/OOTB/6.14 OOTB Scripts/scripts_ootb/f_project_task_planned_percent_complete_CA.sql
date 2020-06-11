SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.planned_percent_complete' ELSE 'SUCCESS' END as Message 
 FROM  (select * from #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from  #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC11
 ON  SRC1.id=SRC11.prid
inner join (select * from  #MDS_TABLE_SCHEMA.prj_ev_history_final   where object_type='TASK') SRC2
on  SRC.prid = SRC2.object_id and SRC.sourceinstance = SRC2.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.PRID = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
left join(select * from  #DWH_TABLE_SCHEMA.d_lov_map)LKP1
on TRGT.project_task_state_src_key=LKP1.src_key
and TRGT.source_id=LKP1.source_id
left join
(select count(*) as actual,TRGT1.row_id, TRGT1.planned_duration,df.refresh,TRGT1.planned_start_on,TRGT1.planned_end_on
 from (select * from   #DWH_TABLE_SCHEMA.f_project_task)TRGT1
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