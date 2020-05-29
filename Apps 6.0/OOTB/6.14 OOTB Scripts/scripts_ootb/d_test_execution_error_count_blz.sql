SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_execution.error_count' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
 left join(select * from #MDS_TABLE_SCHEMA.blz_master_summary_final)SRC1
on SRC.id=SRC1.masterid
and SRC.sourceinstance=SRC1.sourceinstance
left join (select * from  #DWH_TABLE_SCHEMA.d_test_execution)TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where COALESCE(functional_summary_errorsCount,COALESCE(grid_summary_failedTestCasesCount,COALESCE(SRC1.failed,0)))<>COALESCE(TRGT.error_count,'')
