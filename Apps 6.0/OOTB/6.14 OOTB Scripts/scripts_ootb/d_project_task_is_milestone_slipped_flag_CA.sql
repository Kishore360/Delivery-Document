SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.is_milestone_slipped_flag' ELSE 'SUCCESS' END as Message
FROM  (select * from   #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from   #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from    #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC11
 ON  SRC1.id=SRC11.prid
 left join(select * from  #DWH_TABLE_SCHEMA.d_project_task)TRGT
 on SRC.prid=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select actual_end_on,planned_end_on,project_key,row_id,source_id  from #DWH_TABLE_SCHEMA.f_project_task )TRGT1 
 ON (SRC.PRID = TRGT1.row_id 
 AND SRC.sourceinstance=TRGT1.source_id )
LEFT JOIN (select source_id,max(lastupdated) as refresh from  #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) df 
  ON TRGT.source_id = df.source_id
WHERE  CASE WHEN TRGT.is_milestone_flag = 'N' then null
WHEN TRGT.is_milestone_flag='Y' and COALESCE(TRGT1.actual_end_on,df.refresh,'') > TRGT.planned_start_date then 'Y' else 'N' end <> COALESCE(TRGT.is_milestone_slipped_flag)

