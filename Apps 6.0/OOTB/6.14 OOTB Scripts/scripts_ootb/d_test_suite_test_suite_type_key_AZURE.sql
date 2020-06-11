SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_test_execution.test_suite_type_key' ELSE 'SUCCESS' END as Message
 
 from (select * from #MDS_TABLE_SCHEMA.azure_test_suite_final where cdctype<>'D') SRC
 
 left join #DWH_TABLE_SCHEMA.d_lov SUITE_TYP
 on COALESCE(CONCAT('TYPE~TEST_SUITE~',SRC.state),'UNSPECIFIED') = SUITE_TYP.row_id and SUITE_TYP.source_id=SRC.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.d_test_suite TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.soft_deleted_flag <> 'Y' and
 coalesce(SUITE_TYP.row_key,case when SRC.state is null then 0 else -1 end )<>coalesce(TRGT.test_suite_type_key,'');