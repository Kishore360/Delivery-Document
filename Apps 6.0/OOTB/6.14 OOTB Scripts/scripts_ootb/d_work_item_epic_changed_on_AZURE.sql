SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_epic.changed_on' ELSE 'SUCCESS' END as Message
/*select COALESCE(SRC.changedBy ,'') , COALESCE(TRGT.changed_by,'') */
FROM
(select distinct
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
where COALESCE(CONVERT_TZ(SRC.changedDate ,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') 
<> COALESCE(TRGT.changed_on,'')