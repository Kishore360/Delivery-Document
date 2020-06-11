SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_comments.created_by' ELSE 'SUCCESS' END as Message
/* select COALESCE(CONVERT_TZ(SRC.updated ,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),COALESCE(TRGT.changed_on,'') from */
FROM (select * from #MDS_TABLE_SCHEMA.issue_comments_final where cdctype<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_comments TRGT
ON concat(SRC.id,'') = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
where COALESCE(CONVERT_TZ(SRC.updated ,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>COALESCE(TRGT.changed_on,'')