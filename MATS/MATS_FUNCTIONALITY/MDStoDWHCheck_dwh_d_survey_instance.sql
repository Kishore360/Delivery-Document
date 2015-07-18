
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for survey_instance_final to dwh_d_survey_instance' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.survey_instance_final S
join <<tenant>>_mdwdb.lsm_ls_source_timezone L  
on (S.sourceinstance = L.sourceid )
where CRC32(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(convert_tz(S.taken_on,source_time_zone,target_time_zone),''),
ifnull(S.sys_mod_count,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''))
) not in (
select CRC32(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.taken_on,''),
ifnull(DWH.updated_count,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''))
) from <<tenant>>_mdwdb.dwh_d_survey_instance DWH);
