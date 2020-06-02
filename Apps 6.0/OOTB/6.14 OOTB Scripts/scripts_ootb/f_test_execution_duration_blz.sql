
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_test_execution.duration' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
left join(select * from #MDS_TABLE_SCHEMA.blz_master_summary_final)SRC1
on SRC.id=SRC1.masterid
left join  #DWH_TABLE_SCHEMA.f_test_execution TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where round(COALESCE(SRC.functional_summary_responsetime_sum,COALESCE(TIMESTAMPDIFF(MICROSECOND,
CONVERT_TZ(FROM_UNIXTIME( SRC.grid_summary_started),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),
CONVERT_TZ(FROM_UNIXTIME( SRC.grid_summary_ended),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))/1000,COALESCE(SRC1.duration,0))))<>coalesce(TRGT.duration,'')