SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for d_work_item.image_url' ELSE 'SUCCESS' END as Message
from (select * from  #STG_TABLE_SCHEMA.workitem_temp_azure  where cdctype<>'D') SRC
left join #MDS_TABLE_SCHEMA.azure_organization_final org
on org.__numerify__primary_key = SRC.organizationKey and org.sourceinstance = SRC.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_work_item TRGT
on SRC.__numerify__primary_key=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.row_key not in (0, -1) and 
coalesce(CONCAT('<a href=\"https://dev.azure.com/',org.organizationName,'/_workitems/edit/',SRC.id,'">  <img src=../images/Numerify/azure_devOps_url_image.png></a>'),'') <> coalesce(TRGT.image_url,'');