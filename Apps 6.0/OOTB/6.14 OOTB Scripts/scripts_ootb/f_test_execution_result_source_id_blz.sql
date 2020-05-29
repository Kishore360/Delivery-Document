SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_test_execution_result.source_id' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.blz_master_aggregate_report_final where cdctype<>'D') SRC
left join(select * from #MDS_TABLE_SCHEMA.blz_master_final)SRC1
on SRC.masterid=SRC1.id
and SRC.sourceinstance=SRC1.sourceinstance
left join  #DWH_TABLE_SCHEMA.f_test_execution_result TRGT
on CONCAT(SRC.masterid,'_',SRC.labelid)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.sourceinstance,'')<>coalesce(TRGT.source_id,'')
