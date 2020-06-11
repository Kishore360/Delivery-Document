SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_execution.execution_status_src_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON  CONCAT('TEST_EXECUTION~STATUS~', CASE WHEN SRC.passed = 1 then 'PASS' WHEN SRC.passed = 0 then 'FAIL' end) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.passed is null THEN 0 else -1 end)<>COALESCE(TRGT.execution_status_src_key,'');
 
 
