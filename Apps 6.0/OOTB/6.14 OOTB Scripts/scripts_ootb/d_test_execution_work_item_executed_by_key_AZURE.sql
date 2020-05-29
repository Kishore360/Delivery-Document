SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for d_test_execution.executed_by_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.azure_test_run_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_internal_contact contact
on contact.row_id=coalesce(concat('INTERNAL_CONTACT~',SRC.ownerKey),'UNSPECIFIED')
and contact.source_id=SRC.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.__numerify__primary_key=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(contact.row_key,case when SRC.ownerKey is null then 0 else -1 end)
<>coalesce(TRGT.executed_by_key,'');