SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_active_flag' ELSE 'SUCCESS' END as Message 
   FROM  (select * from #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from  #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
inner join (select * from  #MDS_TABLE_SCHEMA.prj_ev_history_final   where object_type='TASK') SRC2
on  SRC.prid = SRC2.object_id and SRC.sourceinstance = SRC2.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
  on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map LKP
on LKP.row_id=concat('PROJECT_TASK~STATE~',SRC.PRSTATUS) and LKP.source_id=TRGT.source_id
 WHERE COALESCE(case when  LKP.dimension_wh_code IN ('IN PROGRESS') then 'Y'  else 'N' end,'')  <>COALESCE(TRGT.is_active_flag ,'')