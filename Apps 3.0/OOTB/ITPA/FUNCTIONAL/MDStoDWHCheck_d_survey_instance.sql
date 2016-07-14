
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for survey_instance_final to d_survey_instance' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.survey_instance_final S

where CRC32(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(convert_tz(S.taken_on,'GMT','America/Los_Angeles'),''),
ifnull(S.sys_mod_count,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,'GMT','America/Los_Angeles'),''),
ifnull(convert_tz(S.sys_updated_on,'GMT','America/Los_Angeles'),''))
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
) from <<tenant>>_mdwdb.d_survey_instance DWH);
