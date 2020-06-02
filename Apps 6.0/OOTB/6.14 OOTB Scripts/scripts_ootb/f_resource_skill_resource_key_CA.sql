SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_skill.resource_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.rsm_skills_associations_final  where object_code='resource' and cdctype<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_resource_skill TRGT 
 ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact D
 on (D.row_id  = CONCAT('INTERNAL_CONTACT~',SRC.object_id) and D.source_id  = SRC.sourceinstance)
 WHERE COALESCE(D.row_key,CASE WHEN SRC.object_id is null THEN 0 else '-1' end)<> COALESCE(TRGT.resource_key,'');