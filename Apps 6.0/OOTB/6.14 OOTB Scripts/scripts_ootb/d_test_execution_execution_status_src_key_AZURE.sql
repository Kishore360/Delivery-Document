SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for d_test_execution.execution_status_src_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.azure_test_run_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_lov lov
on lov.row_id=coalesce(concat('STATUS~TEST_EXECUTION~',SRC.`state`),'UNSPECIFIED')
and lov.source_id=SRC.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.__numerify__primary_key=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(lov.row_key,case when SRC.`state` is null then 0 else -1 end)
<>coalesce(TRGT.execution_status_src_key,'');