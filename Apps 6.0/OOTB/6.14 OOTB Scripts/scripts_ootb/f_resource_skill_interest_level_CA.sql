SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_skill.interest_level' ELSE 'SUCCESS' END as Message
FROM ( select * from  #MDS_TABLE_SCHEMA.rsm_skills_associations_final  where object_code='resource' and cdctype<>'D') SRC 
left join (select * from  #MDS_TABLE_SCHEMA.cmn_lookups_final  where cdctype<>'D')SRC1
on SRC.interest_level_id=SRC1.id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_resource_skill)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
WHERE coalesce(substring(SRC1.lookup_code,1,2),'')<> TRGT.interest_level
