SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_work_status_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
  INNER JOIN(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC2
on SRC.ID=SRC2.PRID
 LEFT JOIN (SELECT * FROM #MDS_TABLE_SCHEMA.odf_ca_inv_final where odf_object_code='project' and cdctype<>'D')SRC1
 ON SRC.ID=SRC1.ID
 AND SRC.sourceinstance=SRC1.sourceinstance
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT
 ON (SRC.id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON (concat('PROJECT','~','WORK_STATUS','~',obj_work_status) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.obj_work_status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_work_status_src_key,'')