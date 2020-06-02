SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_step.changed_on' ELSE 'SUCCESS' END as Message
from (select max(updated) as updated,id,sourceinstance from #MDS_TABLE_SCHEMA.blz_master_final) SRC
inner join(select labelid, sourceinstance, labelname,masterid  from  #MDS_TABLE_SCHEMA.blz_master_aggregate_report_final group by
 sourceinstance,labelid,labelname)SRC1
on SRC1.masterid=SRC.id
and SRC1.sourceinstance=SRC.sourceinstance
left join  (select * from #DWH_TABLE_SCHEMA.d_test_step)TRGT
on SRC1.labelid=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where  coalesce(convert_tz(from_unixtime(SRC.updated),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.changed_on,'')

