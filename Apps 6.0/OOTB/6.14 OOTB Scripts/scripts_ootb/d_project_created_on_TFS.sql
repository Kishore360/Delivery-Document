SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.created_on' ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.dimteamproject_final SRC
  
LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
	ON (SRC.projectnodesk =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id)
 
 where TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
coalesce(convert_tz(SRC.LastUpdatedDateTime,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') ,'') <> coalesce(TRGT.created_on,'');