SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.planned_start_date' ELSE 'SUCCESS' END as Message
FROM  (select * from #MDS_TABLE_SCHEMA.prtask_final  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1
on SRC.prprojectid=SRC1.id
INNER join(select * from  #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC11
 ON  SRC1.id=SRC11.prid
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.prid =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where COALESCE(convert_tz(SRC.prstart,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRGT.planned_start_date ,'')