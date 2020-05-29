SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.cost_variance_color_key' ELSE 'SUCCESS' END as Message 
       FROM  (select * from #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from  #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
inner join (select * from  #MDS_TABLE_SCHEMA.prj_ev_history_final   where object_type='TASK') SRC2
on  SRC.prid = SRC2.object_id and SRC.sourceinstance = SRC2.sourceinstance
left join #DWH_TABLE_SCHEMA.f_project_task TRGT 
   on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov LKP 
ON coalesce(TRGT.cost_variance,0) BETWEEN LKP.lower_range_value AND LKP.upper_range_value
AND LKP.dimension_class = 'WH_PROJECT~COLOR~COST_VARIANCE'
left join #DWH_TABLE_SCHEMA.d_lov_map d_lov_map 
            ON d_lov_map.src_key=TRGT.project_task_state_src_key 
            AND TRGT.source_id=d_lov_map.source_id 
WHERE COALESCE(LKP.row_key, CASE WHEN TRGT.cost_variance is null then 0 else -1 end )<>COALESCE(TRGT.cost_variance_color_key,'')
 