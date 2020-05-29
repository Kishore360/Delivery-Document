SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_test_execution.test_execution_key' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.f_test_execution TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_test_execution LKP
on SRC.id=LKP.row_id
and SRC.sourceinstance=LKP.source_id
where COALESCE(LKP.row_key, case when SRC.id is null then 0 else -1 end,'')<> COALESCE(TRGT.test_execution_key,'')
