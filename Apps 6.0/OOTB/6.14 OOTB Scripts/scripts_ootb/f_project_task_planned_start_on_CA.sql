SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.changed_by' ELSE 'SUCCESS' END as Message
FROM  (select * from    #MDS_TABLE_SCHEMA.prtask_final  where cdctype<>'D') SRC 
left join(select * from    #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from     #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
 and SRC1.sourceinstance=SRC10.sourceinstance
inner join (select * from    #MDS_TABLE_SCHEMA.prj_ev_history_final   where object_type='TASK') SRC2
on  SRC.prid = SRC2.object_id and SRC.sourceinstance = SRC2.sourceinstance
LEFT JOIN   #DWH_TABLE_SCHEMA.f_project_task TRGT 
on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
WHERE COALESCE(convert_tz(SRC.prstart,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRGT.planned_start_on,'')