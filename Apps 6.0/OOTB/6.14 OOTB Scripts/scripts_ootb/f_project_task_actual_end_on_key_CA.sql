 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.actual_end_on_key' ELSE 'SUCCESS' END as Message 
FROM  (select * from #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
    LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
   on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
ON (date_format(TRGT.actual_end_on,'%Y%m%d')= LKP.row_id and LKP.source_id=0)   
   WHERE COALESCE(LKP.row_key,'') <> COALESCE(TRGT.actual_end_on_key,'')