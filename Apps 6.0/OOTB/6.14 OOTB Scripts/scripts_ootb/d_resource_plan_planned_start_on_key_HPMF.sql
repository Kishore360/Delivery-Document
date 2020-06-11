SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.planned_start_on_key' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_rsc_positions_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_resource_plan TRGT
on concat('POSITION~',SRC.position_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE date_format(COALESCE(convert_tz(SRC.start_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d')
<>coalesce(TRGT.planned_start_on_key,'')