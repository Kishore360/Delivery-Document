select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for survey_final to d_survey' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_master_final WHERE CDCTYPE<>'D') S
where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.name,''),
ifnull(S.sys_mod_count,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
ifnull(convert_tz(S.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
) not in (
select concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.survey_name,''),
ifnull(DWH.updated_count,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,'')
) from #DWH_TABLE_SCHEMA.d_survey DWH);
