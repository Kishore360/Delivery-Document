SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_iteration.parent_row_key' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.dimiteration_final SRC
 
 left join #DWH_TABLE_SCHEMA.d_iteration TRGT
 on SRC.IterationSK=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 left join #DWH_TABLE_SCHEMA.d_iteration LKP
 on SRC.parentiterationsk=LKP.row_id
 and SRC.sourceinstance=LKP.source_id
 
 where TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
coalesce(LKP.row_key, case when SRC.parentiterationsk is null then 0 else -1 end)<>coalesce(TRGT.parent_row_key,'')