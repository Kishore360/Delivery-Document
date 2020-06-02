SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_fix_version.work_item_key' ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.issue_fixversions_final SRC
  
 left join #DWH_TABLE_SCHEMA.f_work_item_fix_version TRGT
 on concat(SRC.issueId,'~',SRC.Id)=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
  left join #DWH_TABLE_SCHEMA.d_work_item LKP
 on concat(SRC.issueId,'')=LKP.row_id
 and SRC.sourceinstance=LKP.source_id
 
 where coalesce(LKP.row_key,case when SRC.issueId is null  then 0 else -1 end)<>coalesce(TRGT.work_item_key,'')