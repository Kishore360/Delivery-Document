SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_test_execution.test_case_key' ELSE 'SUCCESS' END as Message
 
 from (select * from #MDS_TABLE_SCHEMA.azure_test_result_final where cdctype<>'D') SRC
 
 left join 
 (select D.*
 from #DWH_TABLE_SCHEMA.d_work_item D
 join #DWH_TABLE_SCHEMA.d_lov_map TYP 
 on TYP.src_key = D.work_item_type_src_key and TYP.source_id = D.source_id
 where TYP.dimension_wh_code = 'TEST CASE') LKP
 on coalesce(SRC.testCaseKey,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.f_test_execution TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.soft_deleted_flag <> 'Y' and
 coalesce(LKP.row_key,case when SRC.testCaseKey is null then 0 else -1 end )<>coalesce(TRGT.test_case_key,'');