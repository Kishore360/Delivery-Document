SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.PLANNED_END_ON' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from #DWH_TABLE_SCHEMA.d_project)SRC1
on SRC.id=SRC1.row_id
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id=TRGT.row_id 
and SRC.sourceinstance=TRGT.source_id
where COALESCE(CONVERT_TZ(SRC.SCHEDULE_FINISH,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') <> COALESCE(TRGT.PLANNED_END_ON,'')