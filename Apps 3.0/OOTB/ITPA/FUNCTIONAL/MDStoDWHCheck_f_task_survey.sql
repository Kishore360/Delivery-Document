select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between task_survey_final and f_task_survey' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.task_survey_final S


left join <<tenant>>_mdsdb.task_final TF
on (TF.sys_id  = S.task 
and TF.sourceinstance  = S.sourceinstance )

left join d_incident INC
on (INC.row_id  = S.task  and upper(TF.sys_class_name)='INCIDENT'
and INC.source_id  = S.sourceinstance )

left join d_problem PRB
on (PRB.row_id  = S.task  and upper(TF.sys_class_name)='PROBLEM'
and PRB.source_id  = S.sourceinstance )

left join d_request REQ
on (REQ.row_id  = S.task  and upper(TF.sys_class_name)='REQUEST'
and REQ.source_id  = S.sourceinstance )

left join d_request_item REQITM
on (REQITM.row_id  = S.task  and upper(TF.sys_class_name)='REQUEST_ITEM'
and REQITM.source_id  = S.sourceinstance )

left join d_request_task REQTSK
on (REQTSK.row_id  = S.task  and upper(TF.sys_class_name)='REQUEST_TASK'
and REQTSK.source_id  = S.sourceinstance )

left join d_problem_task PRBTSK
on (PRBTSK.row_id  = S.task  and upper(TF.sys_class_name)='PROBLEM_TASK'
and PRBTSK.source_id  = S.sourceinstance )

left join d_survey SUR
on (SUR.row_id  = S.survey 
and SUR.source_id  = S.sourceinstance )

left join d_internal_contact DPV
on (DPV.row_id  = concat('INTERNAL_CONTACT~',S.sent_to) 
and DPV.source_id  = S.sourceinstance )

left join d_calendar_date DCD_REQ
on (DCD_REQ.row_id  = date_format(convert_tz(S.requested_date,'GMT','America/Los_Angeles'),'%Y%m%d') 
and DCD_REQ.source_id  =0)

left join d_calendar_time DCT_REQ
on (DCT_REQ.row_id  = date_format(convert_tz(S.requested_date,'GMT','America/Los_Angeles'),'%H%i') 
and DCT_REQ.source_id  =0)

left join d_internal_contact DPV_TKN
on (DPV_TKN.row_id  = concat('INTERNAL_CONTACT~',S.taken_by) 
and DPV_TKN.source_id  = S.sourceinstance )

left join d_calendar_date DCD_COM
on (DCD_COM.row_id  = date_format(convert_tz(S.completed_date,'GMT','America/Los_Angeles'),'%Y%m%d') 
and DCD_COM.source_id  = 0)

left join d_survey_instance DSI
on (DSI.row_id  = S.instance 
and DSI.source_id  = S.sourceinstance )


where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(TF.sys_class_name,''),


ifnull(INC.row_key,case when upper(TF.sys_class_name)='INCIDENT' then -1 else 0 end),
ifnull(PRB.row_key,case when upper(TF.sys_class_name)='PROBLEM'  then -1 else 0 end),
ifnull(REQ.row_key,case when upper(TF.sys_class_name)='REQUEST' then -1 else 0 end),
ifnull(REQITM.row_key,case when upper(TF.sys_class_name)='REQUEST_ITEM' then -1 else 0 end),
ifnull(REQTSK.row_key,case when upper(TF.sys_class_name)='REQUEST_TASK' then -1 else 0 end),
ifnull(PRBTSK.row_key,case when upper(TF.sys_class_name)='PROBLEM_TASK' then -1 else 0 end),
ifnull(SUR.row_key,case when S.survey is not null then -1 else 0 end),
ifnull(DPV.row_key,case when S.sent_to is not null then -1 else 0 end),
ifnull(DCD_REQ.row_key,case when S.requested_date is not null then -1 else '' end),
ifnull(DCT_REQ.row_key,case when S.requested_date is not null then -1 else '' end),


ifnull(S.state,''),
-- ifnull(DPV_TKN.row_key,case when S.taken_by is not null then -1 else 0 end),
ifnull(case when S.state ='requested' then DPV.row_key else DPV_TKN.row_key end,
case when case when S.state ='requested' then S.sent_to else S.taken_by end is not null then -1 else 0 end),

coalesce(DCD_COM.row_key,case when S.completed_date is not null then -1 else '' end),
coalesce(DSI.row_key,case when S.instance is not null then -1 else 0 end),
ifnull(S.sys_mod_count,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,'GMT','America/Los_Angeles'),''),
ifnull(convert_tz(S.sys_updated_on,'GMT','America/Los_Angeles'),''))

not in ( 
select concat( 
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
 from <<tenant>>_mdwdb.f_task_survey DWH)
-- and S.sys_id not in ( '09e68e3cc0a80a6b003b157f6f920c21','09e67415c0a80a6b00bf399169852aef')
;
