SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.is_upcoming_flag' ELSE 'SUCCESS' END as Message
FROM  (select * from  #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from  #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from   #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC11
 ON  SRC1.id=SRC11.prid
 left join(select * from #DWH_TABLE_SCHEMA.d_project_task)TRGT
 on SRC.prid=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT1 
 ON (SRC.PRID = TRGT1.row_id 
 AND SRC.sourceinstance=TRGT1.source_id )
left join(select * from  #DWH_TABLE_SCHEMA.d_lov_map)LKP1
on TRGT.project_task_state_src_key=LKP1.src_key
and TRGT.source_id=LKP1.source_id
LEFT JOIN (select source_id,max(lastupdated) as refresh from #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id) df 
  ON TRGT1.source_id = df.source_id
WHERE COALESCE(CASE WHEN LKP1.dimension_wh_code  IN ('OPEN') and TRGT1.planned_start_on > df.refresh THEN 'Y' ELSE 'N' END,'') <> 
COALESCE(TRGT.is_upcoming_flag,'')