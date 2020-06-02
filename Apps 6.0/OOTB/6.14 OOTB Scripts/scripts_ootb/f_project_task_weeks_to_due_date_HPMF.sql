SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.weeks_to_due_date' ELSE 'SUCCESS' END as Message 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hp_wp_tasks_final  WHERE CDCTYPE<>'D') SRC
LEFT JOIN #MDS_TABLE_SCHEMA.hp_wp_task_info_final SRC5
on SRC.TASK_INFO_ID = SRC5.TASK_INFO_ID 
and SRC.sourceinstance = SRC5.sourceinstance 
LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
ON SRC.TASK_ID=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP
ON LKP.row_id=concat('PROJECT_TASK~STATE~',SRC5.STATUS) 
AND LKP.source_id=SRC.sourceinstance
LEFT join 
(select source_id,max(lastupdated) as lastupdated from
  #DWH_TABLE_SCHEMA.d_o_data_freshness TRGT
group by source_id) FRSH
on FRSH.source_id=TRGT.source_id
 WHERE  LKP.dimension_wh_code not IN ('CLOSED')
 and 
  round(DATEDIFF(TRGT.planned_end_on,FRSH.lastupdated)/7,2) 
          <> round(coalesce(TRGT.weeks_to_due_date,''),2)