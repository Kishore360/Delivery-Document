SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_execution.source_id' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.sourceinstance,'')<>coalesce(TRGT.source_id,'')
