select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for survey_instance_final to d_survey_instance' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') S
where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(convert_tz(S.taken_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
ifnull(S.sys_mod_count,''),
ifnull(convert_tz(S.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
ifnull(convert_tz(S.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
) not in (
select concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.taken_on,''),
ifnull(DWH.updated_count,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,'')
) from #DWH_TABLE_SCHEMA.d_survey_instance DWH);
