select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for survey_response_final to f_response' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_response_final WHERE CDCTYPE<>'D') S

left join ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') si 
on S.instance = si.sys_id

left join #DWH_TABLE_SCHEMA.d_survey sur
on sur.row_id =  si.survey  AND sur.source_id =  si.sourceinstance 

left join #DWH_TABLE_SCHEMA.d_survey_question sur_ques
on sur_ques.row_id =  S.question  AND sur_ques.source_id =  S.sourceinstance

left join #DWH_TABLE_SCHEMA.d_survey_instance sur_inst
on sur_inst.row_id =  S.instance  AND sur_inst.source_id =  S.sourceinstance

where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(case when si.survey is null then 0 when si.survey is not null and sur.row_key is null then -1 else sur.row_key end, ''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
ifnull(S.sys_created_by,''),
ifnull(convert_tz(S.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
ifnull(case when S.question is null then 0 when S.question is not null and sur_ques.row_key is null then -1 else sur_ques.row_key end, ''),
ifnull(replace(S.response,'\n',''),''),
ifnull(coalesce(S.answer_integer, case when replace(S.response,'\n','') REGEXP '^[0-9]+$' then replace(S.response,'\n','')  else S.answer_integer end ),''),
ifnull(case when S.instance is null then 0 when S.instance is not null and sur_inst.row_key is null then -1 else sur_inst.row_key end, ''),
ifnull(S.sys_mod_count,'')
) not in (
select concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.survey_key,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.created_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.question_key,''),
ifnull(DWH.response,''),
ifnull(DWH.response_value,''),
ifnull(DWH.survey_instance_key,''),
ifnull(DWH.updated_count,'')
) from #DWH_TABLE_SCHEMA.f_response DWH);
