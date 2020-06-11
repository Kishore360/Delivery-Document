SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_test_execution.test_suite_key' ELSE 'SUCCESS' END as Message
 
 from (select * from #MDS_TABLE_SCHEMA.azure_test_result_final where cdctype<>'D') SRC
 
 left join #DWH_TABLE_SCHEMA.d_test_suite LKP
 on coalesce(SRC.testSuiteKey,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.f_test_execution TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.soft_deleted_flag <> 'Y' and
 coalesce(LKP.row_key,case when SRC.testSuiteKey is null then 0 else -1 end )<>coalesce(TRGT.test_suite_key,'');