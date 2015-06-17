


select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between task_survey_final and f_task_survey' else 'SUCCESS' end as Message;
select S.sys_id from <<tenant>>_mdsdb.task_survey_final S
join app_test.lsm_ls_source_timezone L 
on(convert(S.sourceinstance using utf8)  = convert(L.sourceid using utf8))

left join <<tenant>>_mdsdb.task_final TF
on (convert(TF.sys_id using utf8) = convert(S.task using utf8))

left join d_incident INC
on (convert(INC.row_id using utf8) = convert(S.task using utf8)) and upper(TF.sys_class_name)='INCIDENT'

left join d_problem PRB
on (convert(PRB.row_id using utf8) = convert(S.task using utf8)) and upper(TF.sys_class_name)='PROBLEM'

left join d_request REQ
on (convert(REQ.row_id using utf8) = convert(S.task using utf8)) and upper(TF.sys_class_name)='REQUEST'

left join d_request_item REQITM
on (convert(REQITM.row_id using utf8) = convert(S.task using utf8)) and upper(TF.sys_class_name)='REQUEST_ITEM'

left join d_request_task REQTSK
on (convert(REQTSK.row_id using utf8) = convert(S.task using utf8)) and upper(TF.sys_class_name)='REQUEST_TASK'

left join d_problem_task PRBTSK
on (convert(PRBTSK.row_id using utf8) = convert(S.task using utf8)) and upper(TF.sys_class_name)='PROBLEM_TASK'

left join d_survey SUR
on (convert(SUR.row_id using utf8) = convert(S.survey using utf8))

left join d_party DPV
on (convert(DPV.row_id using utf8) = convert(concat('INTERNAL_CONTACT~',S.sent_to) using utf8))

left join d_calendar_date DCD_REQ
on (convert(DCD_REQ.row_id using utf8) = convert(date_format(S.requested_date,'%Y%m%d') using utf8))

left join d_calendar_time DCT_REQ
on (convert(DCT_REQ.row_id using utf8) = convert(date_format(convert_tz(S.requested_date,source_time_zone,target_time_zone),'%H%i') using utf8))

left join d_party DPV_TKN
on (convert(DPV_TKN.row_id using utf8) = convert(concat('INTERNAL_CONTACT~',S.taken_by) using utf8))

left join d_calendar_date DCD_COM
on (convert(DCD_COM.row_id using utf8) = convert(date_format(convert_tz(S.completed_date,source_time_zone,target_time_zone),'%Y%m%d') using utf8))

left join d_survey_instance DSI
on (convert(DSI.row_id using utf8) = convert(S.instance using utf8))

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(TF.sys_class_name,''),
ifnull(INC.row_key,'-1'),
ifnull(PRB.row_key,'-1'),
ifnull(REQ.row_key,'-1'),
ifnull(REQITM.row_key,'-1'),
ifnull(REQTSK.row_key,'-1'),
ifnull(PRBTSK.row_key,'-1'),
ifnull(SUR.row_key,'-1'),
ifnull(DPV.row_key,'-1'),
ifnull(DCD_REQ.row_key,'-1'),
ifnull(DCT_REQ.row_key,'-1'),
ifnull(S.state,''),
ifnull(DPV_TKN.row_key,case when S.taken_by is not null then -1 else 0 end),
coalesce(DCD_COM.row_key,case when S.completed_date is not null then -1 else 0 end),
coalesce(DSI.row_key,case when S.instance is not null then -1 else 0 end),
ifnull(S.sys_mod_count,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''))
using utf8)) not in ( 
select CRC32(convert(concat( 
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.task_type,''),
ifnull(DWH.incident_key,''),
ifnull(DWH.problem_key,''),
ifnull(DWH.request_key,''),
ifnull(DWH.request_item_key,''),
ifnull(DWH.request_task_key,''),
ifnull(DWH.problem_task_key,''),
ifnull(DWH.survey_key,''),
ifnull(DWH.sent_to_key,''),
ifnull(DWH.requested_on_key,''),
ifnull(DWH.requested_time_key,''),
ifnull(DWH.state,''),
ifnull(DWH.taken_by_key,''),
ifnull(DWH.completed_on_key,''),
ifnull(DWH.survey_instance_key,''),
ifnull(DWH.updated_count,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''))
using utf8)) from <<tenant>>_mdwdb.f_task_survey DWH);
