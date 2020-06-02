SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_work_item.created_by' ELSE 'SUCCESS' END as Message
from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key,'')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_internal_contact TRGT1
on TRGT1.row_id=concat('INTERNAL_CONTACT~',SRC.createdByKey)
and TRGT1.source_id=SRC.sourceinstance
where coalesce(SRC.createdByKey,'' )<>coalesce(TRGT.created_by,'');