SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_iteration.completion_date' ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.dimiteration_final SRC
  
 left join #DWH_TABLE_SCHEMA.d_iteration TRGT
 on SRC.IterationSK=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
coalesce(convert_tz(SRC.finishdate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.completion_date,'')