SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.soft_deleted_flag' ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.issue_final SRC

 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 where coalesce(case when SRC.cdctype = 'D' then 'Y' else 'N' end,'')<>coalesce(TRGT.soft_deleted_flag,'')