SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_execution.testcase_count' ELSE 'SUCCESS' END as Message
from  (select * from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
 join(select masterid as row_id, count(id) as test_count,id  from #MDS_TABLE_SCHEMA.blz_master_scenario_final group by row_id)SRC1
on SRC.id=SRC1.row_id
left join (select * from  #DWH_TABLE_SCHEMA.d_test_execution)TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where COALESCE(SRC.functional_summary_testsCount,COALESCE(SRC.grid_summary_testCasesCount,COALESCE(SRC1.test_count,0)))<>COALESCE(TRGT.testcase_count,'')