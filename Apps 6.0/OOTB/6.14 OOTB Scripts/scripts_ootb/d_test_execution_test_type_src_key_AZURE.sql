-- No source column till now

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for d_test_execution.test_type_src_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.azure_test_run_final where cdctype<>'D') SRC
/*left join #DWH_TABLE_SCHEMA.d_lov lov
on lov.row_id=coalesce(concat('TYPE~TEST_EXECUTION~',SRC.workItemType),'UNSPECIFIED') and lov.source_id=SRC.sourceinstance*/
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.__numerify__primary_key=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where -- coalesce(lov.row_key,case when SRC.workItemType is null then 0 else -1 end)
coalesce(null, 0) <>coalesce(TRGT.test_type_src_key,'');