SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.week_day_count' ELSE 'SUCCESS' END as Message 
  FROM  (select * from #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
left join (select * from #MDS_TABLE_SCHEMA.prj_ev_history_final SRC  where cdctype<>'D') SRC2
on  SRC.prid = SRC2.object_id and SRC.sourceinstance = SRC2.sourceinstance
       LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
   on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
  left join
(select count(*) as weekdaycount,TRGT1.row_id, TRGT1.week_day_count
 from (select * from #DWH_TABLE_SCHEMA.f_project_task)TRGT1
LEFT JOIN (
 select source_id,max(lastupdated) as refresh from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT1.source_id = df.source_id )
inner join(select * from #DWH_TABLE_SCHEMA.d_calendar_date)LKP
on LKP.calendar_date between (CASE WHEN DATE_FORMAT(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on), '%H-%i-%s') < '17-00-00' THEN 
  CAST(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on) AS DATE)
 ELSE 
  CAST(DATE_ADD(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on), INTERVAL 1 DAY) AS DATE) 
 END ) and df.refresh
and LKP.week_day_flag = 'Y' AND LKP.calendar_code = 0
group by TRGT1.row_key)TRG
on TRGT.row_id=TRG.row_id
WHERE COALESCE(TRG.weekdaycount,0)<>COALESCE(TRGT.week_day_count,0)
