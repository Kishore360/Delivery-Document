SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_business_alignment_score' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.odf_ca_inv_final where cdctype<>'D')SRC1
on SRC.id=SRC1.id
INNER JOIN(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC2
on SRC.ID=SRC2.PRID
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where round(COALESCE(coalesce(SRC1.obj_align_factor1,0)+coalesce(SRC1.obj_align_factor2,0)+coalesce(SRC1.obj_align_factor3,0)+
coalesce(SRC1.obj_align_factor4,0)+coalesce(SRC1.obj_align_factor5,0)+coalesce(SRC1.obj_align_factor6,0))/ 
NULLIF((IF(SRC1.obj_align_factor1 is null, 0,1)+IF(SRC1.obj_align_factor2 is null, 0,1)+
IF(SRC1.obj_align_factor3 is null, 0,1)+IF(SRC1.obj_align_factor4 is null, 0,1)+IF(SRC1.obj_align_factor5 is null, 0,1)+
IF(SRC1.obj_align_factor6 is null, 0,1)),0)) <> COALESCE(TRGT.project_business_alignment_score,'')
