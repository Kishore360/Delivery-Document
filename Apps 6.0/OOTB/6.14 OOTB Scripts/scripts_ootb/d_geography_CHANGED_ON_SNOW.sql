select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_geography.CHANGED_ON' ELSE 'SUCCESS' END as Message
-- select coalesce(convert_tz(SRC.sys_updated_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),''),coalesce(TRGT.CHANGED_ON,'')
from(select * from #MDS_TABLE_SCHEMA.cmn_location_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_geography where soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and SRC.sys_id=TRGT.row_id
where coalesce(convert_tz(SRC.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.CHANGED_ON,'');