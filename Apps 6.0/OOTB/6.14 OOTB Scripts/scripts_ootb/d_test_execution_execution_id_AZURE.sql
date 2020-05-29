SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_test_execution.execution_id' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.azure_test_run_final SRC
 
 left join #DWH_TABLE_SCHEMA.d_test_execution TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(SRC.id,'')<>coalesce(TRGT.execution_id,'')