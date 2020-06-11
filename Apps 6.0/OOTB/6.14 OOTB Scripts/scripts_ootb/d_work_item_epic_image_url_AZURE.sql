SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_epic.image_url' ELSE 'SUCCESS' END as Message
/*select TRGT.row_id,
CONCAT('<a href=\"https://dev.azure.com/',org.organizationName,'/_workitems/edit/',SRC.`key`,'">  <img src=../images/Numerify/azure_devOps_url_image.png></a>') sr , COALESCE(TRGT.image_url,'') tg*/
FROM
(select 
a.__numerify__primary_key as id,
a.id as `key`,
a.sourceinstance as sourceinstance,
a.description,
a.title,
-- a.url,
a.cdctype,
a.createdByKey,
a.changedByKey,
a.createdDate,
a.changedDate,
a.id as workitemid,
a.workItemType,
a.organizationKey
from #STG_TABLE_SCHEMA.workitem_temp_azure a left join #DWH_TABLE_SCHEMA.d_lov_map b 
ON concat('TYPE~WORK_ITEM~',a.workItemType) = b.src_rowid and a.sourceinstance = b.source_id 
where a.cdctype <> 'D' and b.dimension_wh_code = 'EPIC') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_epic TRGT
ON SRC.id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
left join #MDS_TABLE_SCHEMA.azure_organization_final org
on org.__numerify__primary_key = SRC.organizationKey and org.sourceinstance = SRC.sourceinstance
where coalesce(CONCAT('<a href=\"https://dev.azure.com/',org.organizationName,'/_workitems/edit/',SRC.`key`,'">  <img src=../images/Numerify/azure_devOps_url_image.png></a>'),'') <> coalesce(TRGT.image_url,'');