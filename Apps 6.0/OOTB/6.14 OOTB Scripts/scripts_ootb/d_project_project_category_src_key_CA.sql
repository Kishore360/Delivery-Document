SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_category_src_key' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
  INNER JOIN(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC2
on SRC.ID=SRC2.PRID 
  LEFT JOIN (SELECT * FROM #MDS_TABLE_SCHEMA.odf_ca_project_final where  cdctype<>'D')SRC1
  on SRC.id=SRC1.id
  and SRC.sourceinstance=SRC1.sourceinstance  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON (concat('PROJECT','~','CATEGORY','~',obj_request_category) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.obj_request_category IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_category_src_key,'')