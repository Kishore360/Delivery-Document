SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_iteration.row_id' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.dimiteration_final SRC
 
 left join #DWH_TABLE_SCHEMA.d_iteration TRGT
 on SRC.IterationSK=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
coalesce(SRC.iterationsk,'')<>coalesce(TRGT.row_id,'')