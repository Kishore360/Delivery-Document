SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_execution.ended_on' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
left join #MDS_TABLE_SCHEMA.blz_master_summary_final master_summary
ON SRC.id=master_summary.masterId
left join #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.ended_on,'')<>COALESCE(CONVERT_TZ(FROM_UNIXTIME(master_summary.last),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),
COALESCE(CONVERT_TZ(FROM_UNIXTIME(SRC.grid_summary_ended),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),
CONVERT_TZ(FROM_UNIXTIME(SRC.ended),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')))