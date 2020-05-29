SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_management_office_key' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
INNER JOIN(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC2
on SRC.ID=SRC2.PRID
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.odf_ca_project_final where cdctype<>'D')SRC1
on SRC.id=SRC1.id
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_project)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact D
 on (D.row_id  = CONCAT('INTERNAL_CONTACT~',SRC1.obj_stakeholder2) and D.source_id  = SRC.sourceinstance)
 WHERE COALESCE(D.row_key,'0')<> COALESCE(TRGT.project_management_office_key,'');