SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_work_item.created_by_key' ELSE 'SUCCESS' END as Message
from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_internal_contact contact
on contact.row_id=coalesce(concat('INTERNAL_CONTACT~',SRC.createdByKey),'UNSPECIFIED')
and contact.source_id=SRC.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_work_item TRGT
on SRC.__numerify__primary_key=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(contact.row_key,case when SRC.createdByKey is null then 0 else -1 end) <>coalesce(TRGT.created_by_key,'');