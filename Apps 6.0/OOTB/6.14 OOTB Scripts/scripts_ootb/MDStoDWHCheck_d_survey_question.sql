select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for survey_question_new_final to d_survey_question' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_question_new_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.d_lov lov
on lov.row_id = concat('TYPE','~','QUESTION','~',upper(S.type))
where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(case when S.active = 1 then 'Y' else 'N' end, ''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
ifnull(S.sys_created_by,''),
ifnull(convert_tz(S.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
ifnull(S.scale_max,''),
ifnull(S.scale_min,''),
ifnull(replace(S.question_text,'\n',''),''),
ifnull(S.order,''),
ifnull(S.type,''),
ifnull(case when S.type is null then 0 when S.type is not null and lov.row_key is null then -1 else lov.row_key end,''),
ifnull(S.sys_mod_count,'')
) not in (
select concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.active_flag,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.created_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.max_value,''),
ifnull(DWH.min_value,''),
ifnull(DWH.question,''),
ifnull(DWH.question_order,''),
ifnull(DWH.question_type_src_code,''),
ifnull(DWH.question_type_src_key,''),
ifnull(DWH.updated_count,'')
) from #DWH_TABLE_SCHEMA.d_survey_question DWH);
