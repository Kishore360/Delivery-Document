SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_test_execution.work_item_iteration_m2m_key' ELSE 'SUCCESS' END as Message
 
 from (select * from #MDS_TABLE_SCHEMA.azure_test_result_final where cdctype<>'D') SRC
 left join #MDS_TABLE_SCHEMA.azure_test_run_final TR
 on SRC.testRunKey = TR.__numerify__primary_key and SRC.sourceinstance=TR.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.d_iteration LKP
 on coalesce(TR.iterationKey,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.f_test_execution TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.soft_deleted_flag <> 'Y' and
 coalesce(LKP.row_key,case when SRC.testRunKey is null then 0 else -1 end )<>coalesce(TRGT.work_item_iteration_m2m_key,'');