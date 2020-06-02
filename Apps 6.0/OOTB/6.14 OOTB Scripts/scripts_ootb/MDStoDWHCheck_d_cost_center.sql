select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cost_center' ELSE 'SUCCESS' END as Message
from app_test.ds_cost_center SRC
left join #DWH_TABLE_SCHEMA.d_cost_center TRGT
on(SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id)

left join #DWH_TABLE_SCHEMA.d_location LKP
on(SRC.location_id=TRGT.row_id
and SRC.source_id=TRGT.source_id)

where concat(coalesce(SRC.row_id,''),coalesce(SRC.source_id,''),coalesce(SRC.parent_row_id,''),coalesce(SRC.cost_center_name,'')
,coalesce(SRC.cost_center_manager,''),coalesce(SRC.cost_center_id,''),coalesce(SRC.cost_center_account,'')
,coalesce(SRC.active_flag,''),coalesce(SRC.cost_center_code,''),coalesce(LKP.row_key,case when SRC.location_id is null then '0' else '-1' end)
 ,coalesce(convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
 ,coalesce(convert_tz(SRC.changed_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
 )  
<>concat(coalesce(TRGT.row_id,''),coalesce(TRGT.source_id,''),coalesce(TRGT.parent_row_id,''),coalesce(TRGT.cost_center_name,'')
,coalesce(TRGT.cost_center_manager,''),coalesce(TRGT.cost_center_id,''),coalesce(TRGT.cost_center_account,''),coalesce(TRGT.active_flag,'')
,coalesce(TRGT.cost_center_code,''),coalesce(TRGT.location_key,'') ,coalesce(TRGT.created_on,''),coalesce(TRGT.changed_on,'')
) COLLATE utf8_unicode_ci