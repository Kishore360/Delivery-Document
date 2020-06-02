SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_affected_version.row_id' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.issue_affectedversions_final SRC
 
 left join #DWH_TABLE_SCHEMA.f_work_item_affected_version TRGT
 on concat(SRC.issueId,'~',SRC.Id)=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(SRC.sourceinstance,'')<>coalesce(TRGT.source_id,'')