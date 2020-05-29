SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_skill.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM ( select * from  #MDS_TABLE_SCHEMA.rsm_skills_associations_final  where object_code='resource' and cdctype<>'D') SRC 
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_resource_skill)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where coalesce(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'') <> COALESCE(TRGT.soft_deleted_flag ,'')

