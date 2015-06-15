


select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed from survey_question_new_final to d_survey_question' else 'SUCCESS' end as Message
from #MDS_TABLE_SCHEMA.survey_question_new_final S
join app_test.lsm_ls_source_timezone L
on (convert(S.sourceinstance using utf8) = convert(L.sourceid using utf8))

left join d_lov DLOV
on (convert(DLOV.row_id using utf8) = convert(concat('TYPE~QUESTION~~~',upper(S.type)) using utf8)
and convert(DLOV.source_id using utf8) = convert((case when S.type is null then 0 else S.sourceinstance end) using utf8))

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(replace(S.question_text,'\n',''),''),
ifnull(S.order,''),
ifnull(S.scale_min,''),
ifnull(S.scale_max,''),
ifnull(S.type,''),
ifnull(S.sys_mod_count,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
ifnull(DLOV.row_key,'-1'),
case when S.active = 1 then 'Y' else 'N' end)
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.question,''),
ifnull(DWH.question_order,''),
ifnull(DWH.min_value,''),
ifnull(DWH.max_value,''),
ifnull(DWH.question_type_src_code,''),
ifnull(DWH.updated_count,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.question_type_src_key,''),
ifnull(DWH.active_flag,''))
using utf8)) from #TABLE_SCHEMA.d_survey_question DWH);
