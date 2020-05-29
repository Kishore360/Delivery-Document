SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.PLANNED_OPERATING_DOC_COST' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.id=SRC1.PRID
LEFT JOIN (select * from #MDS_TABLE_SCHEMA.odf_object_instance_mapping_final)odf
on odf.primary_object_instance_id=SRC.id and odf.PRIMARY_OBJECT_INSTANCE_CODE='project'
LEFT JOIN (select * from #MDS_TABLE_SCHEMA.fin_financials_final)SRC2
on odf.secondary_object_instance_id=SRC2.id and odf.SECONDARY_OBJECT_INSTANCE_CODE='financials'
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC2.PLANNED_CST_OPERATING_TOTAL,0) <> COALESCE(TRGT.PLANNED_OPERATING_DOC_COST,'')