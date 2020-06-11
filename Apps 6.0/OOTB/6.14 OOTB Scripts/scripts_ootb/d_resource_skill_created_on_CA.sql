SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_resource_skill.created_on' ELSE 'SUCCESS' END as Message
FROM ( select * from  #MDS_TABLE_SCHEMA.rsm_skills_final where cdctype<>'D') SRC 
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_resource_skill)TRGT   
ON SRC.id =TRGT.row_id 
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(convert_tz(SRC.created_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') <> COALESCE(TRGT.created_on,'')