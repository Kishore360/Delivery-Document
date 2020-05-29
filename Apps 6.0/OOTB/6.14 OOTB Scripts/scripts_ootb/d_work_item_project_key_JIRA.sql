SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.project_key' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
 left join #DWH_TABLE_SCHEMA.d_project LKP
 on SRC.project_id=LKP.row_id
 and SRC.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(LKP.row_key,case when SRC.project_id is null then 0 else -1 end )<>coalesce(TRGT.project_key,'')