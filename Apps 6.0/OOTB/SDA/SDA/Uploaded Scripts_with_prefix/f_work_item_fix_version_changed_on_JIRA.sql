

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_fix_version.changed_on' ELSE 'SUCCESS' END as Message
 from 
 
 #MDS_TABLE_SCHEMA.issue_fixversions_final SRC
  
 left join #DWH_TABLE_SCHEMA.f_work_item_fix_version TRGT
 on concat(SRC.issueId,'~',SRC.Id)=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(
 convert_tz(SRC.updated,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') ,'') <>coalesce(TRGT.changed_on,'')