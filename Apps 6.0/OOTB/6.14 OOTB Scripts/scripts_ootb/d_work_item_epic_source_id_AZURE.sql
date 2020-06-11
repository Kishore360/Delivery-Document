SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.source_id' ELSE 'SUCCESS' END as Message
/*select COALESCE(SRC.id,''), COALESCE(TRGT.row_id,'') */
FROM
(select 
a.__numerify__primary_key as id,
a.sourceinstance as sourceinstance,
a.description,
a.title,
-- a.url,
a.cdctype,
a.createdByKey,
a.changedByKey,
a.createdDate,
a.changedDate,
a.workItemType
from #STG_TABLE_SCHEMA.workitem_temp_azure a left join #DWH_TABLE_SCHEMA.d_lov_map b 
ON concat('TYPE~WORK_ITEM~',a.workItemType) = b.src_rowid and a.sourceinstance = b.source_id 
where a.cdctype <> 'D' and b.dimension_wh_code = 'EPIC') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_epic TRGT
ON SRC.id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
where COALESCE(SRC.sourceinstance,'') <> COALESCE(TRGT.source_id,'')