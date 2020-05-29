SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_work_item.work_item_priority_src_key' ELSE 'SUCCESS' END as Message
from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_lov_map lov
on lov.src_rowid=coalesce(concat('PRIORITY~WORK_ITEM~',SRC.msvsts_common_priority),'UNSPECIFIED')
and lov.source_id=SRC.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_work_item TRGT
on SRC.__numerify__primary_key=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(lov.src_key, case when SRC.msvsts_common_priority is null then 0 else -1 end)
<>coalesce(TRGT.work_item_priority_src_key,'');