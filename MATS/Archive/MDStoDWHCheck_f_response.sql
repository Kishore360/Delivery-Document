


select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between survey_response_final and f_response' else 'SUCCESS' end as Message
from #MDS_TABLE_SCHEMA.survey_response_final S
join app_test.lsm_ls_source_timezone L 
on(convert(S.sourceinstance using utf8)  = convert(L.sourceid using utf8))

left join d_survey_instance DSI
on (convert(DSI.row_id using utf8) = convert(S.instance using utf8))

left join d_survey_question DSQ
on (convert(DSQ.row_id using utf8) = convert(S.question using utf8))

where CRC32(convert(concat( 
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.answer_integer,''),
ifnull(replace(S.response,'\n',''),''),
ifnull(S.sys_mod_count,''),
ifnull(DSI.row_key,'-1'),
ifnull(DSQ.row_key,'-1'),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''))
using utf8)) not in (
select CRC32(convert(concat( 
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.response_value,''),
ifnull(DWH.response,''),
ifnull(DWH.updated_count,''),
ifnull(DWH.survey_instance_key,''),
ifnull(DWH.question_key,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''))
using utf8)) from #TABLE_SCHEMA.f_response DWH);
