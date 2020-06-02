SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_step.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from (select * from #MDS_TABLE_SCHEMA.blz_master_final) SRC
inner join(select labelid, sourceinstance, labelname,masterid  from  #MDS_TABLE_SCHEMA.blz_master_aggregate_report_final group by
 sourceinstance,labelid,labelname)SRC1
on SRC1.masterid=SRC.id
and SRC1.sourceinstance=SRC.sourceinstance
left join  (select * from #DWH_TABLE_SCHEMA.d_test_step)TRGT
on SRC1.labelid=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'') <> COALESCE(TRGT.soft_deleted_flag ,'')
