SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  (select * from  #MDS_TABLE_SCHEMA.prtask_final  where cdctype<>'D') SRC 
inner join(select * from  #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
LEFT JOIN (select * from    #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.prid =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_lov_map)LKP
ON TRGT.project_task_state_src_key=LKP.src_key     
where CASE WHEN dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END <> TRGT.is_active_flag 
