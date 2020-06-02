SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_step.step_id' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.blz_labels_final where cdctype<>'D') SRC
left join(select * from #MDS_TABLE_SCHEMA.blz_master_final)SRC1
on SRC.master_id=SRC1.id
and SRC.sourceinstance=SRC1.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_test_step TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where COALESCE(SRC.id,'')<>COALESCE(TRGT.step_id,'')