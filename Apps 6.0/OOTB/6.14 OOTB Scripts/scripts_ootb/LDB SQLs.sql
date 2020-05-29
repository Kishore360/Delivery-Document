View SQLs

select LOV3.source_dimension_name new_state,
(avg(fa.state_duration)/3600) state_dur
from (
select cr.*
from ldb.f_request_task_state_activity cr
) fa
left join ldb.d_request_task d
on fa.request_task_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.state_on_key
left join ldb.d_sc_task_to_state LOV3
on LOV3.row_key = fa.to_state_key 
where CAL.lagging_count_of_month between 0 and 12
group by new_state
order by new_state


select 
d.request_task_number req_num, 
REQ.request_number req,
REQ_ITEM.request_item_number req_item,
d.short_description shrt,
d.opened_on opened, 
d.work_start_on act_strt,
d.work_end_on act_end,
d.closed_on closed,
LOV3.source_dimension_name new_state,
coalesce(LOV4.source_dimension_name, 'UNSPECIFIED') old_state,
LOV1.source_dimension_name priority, 
CNT.full_name asignee, 
ORG.organization_name asgn_grp,
null as due_date,

(sum(fa.state_duration)/3600) state_dur,
max(d.state_count) state_cnt
from (
select rt.*
from ldb.f_request_task_state_activity rt
join 
(
select  /*max(frta.primary_sequence_id) seq_id,*/ max(CAL.calendar_date) crtdt, frta.request_task_key, frta.state_on_key
from ldb.f_request_task_state_activity frta
left join ldb.d_calendar_date CAL
on CAL.row_key = frta.state_on_key
group by frta.request_task_key, frta.state_on_key
) SQ
on SQ.state_on_key = rt.state_on_key and SQ.request_task_key = rt.request_task_key
-- SQ.seq_id = rt.primary_sequence_id and SQ.task_key = rt.task_key
) fa
left join ldb.d_request_task d
on fa.request_task_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.state_on_key
left join ldb.d_request REQ
on REQ.row_key = fa.request_key
left join ldb.d_request_item REQ_ITEM
on REQ_ITEM.row_key = fa.request_item_key
left join ldb.d_sc_task_priority LOV1
on LOV1.row_key = fa.priority_src_key
left join ldb.d_internal_contact_assigned_to CNT
on CNT.row_key = fa.assigned_to_key
left join ldb.d_internal_organization_group ORG
on ORG.row_key = fa.assignment_group_key
left join ldb.d_sc_task_upon_approval LOV2
on LOV2.row_key = fa.upon_approval_src_key
left join ldb.d_sc_task_to_state LOV3
on LOV3.row_key = fa.to_state_key
left join ldb.d_sc_task_from_state LOV4
on LOV4.row_key = fa.from_state_key
where CAL.lagging_count_of_month between 0 and 12
-- and fa.task_wh_type = 'sc_task'
-- AND fa.task_attribute_wh_name = 'state'
-- and LOV3.source_dimension_name <> 'Canceled'
group by req_num, req, req_item, shrt, opened, act_strt, act_end, closed, new_state, old_state, priority, asignee, asgn_grp, due_date
order by d.request_task_number
--limit 20


select 
d.change_request_number req_num, 
d.opened_on opened, 
LOV1.source_dimension_name cr_type, 
CNT.full_name asignee, 
LOV2.source_dimension_name risk, 
LOV3.source_dimension_name new_state,
coalesce(LOV4.source_dimension_name, 'UNSPECIFIED') old_state,
null as due_date,
d.closed_on closed,
(sum(fa.state_duration)/3600) state_dur,
max(d.state_count) state_cnt
from (
select cr.*
from ldb.f_change_request_state_activity cr
join 
(
select  /*max(fcra.primary_sequence_id) seq_id,*/ max(CAL.calendar_date) crtdt, fcra.change_request_key, fcra.state_on_key
from ldb.f_change_request_state_activity fcra
left join ldb.d_calendar_date CAL
on CAL.row_key = fcra.state_on_key
group by fcra.change_request_key, fcra.state_on_key
) SQ
on SQ.state_on_key = cr.state_on_key and SQ.change_request_key = cr.change_request_key
) fa
left join ldb.d_change_request d
on fa.change_request_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.state_on_key
left join ldb.d_change_request_type LOV1
on LOV1.row_key = d.type_src_key
left join ldb.d_internal_contact_assigned_to CNT
on CNT.row_key = d.assigned_to_key
left join ldb.d_change_request_risk LOV2
on LOV2.row_key = d.risk_src_key
left join ldb.d_change_request_to_state LOV3
on LOV3.row_key = fa.to_state_key
left join ldb.d_change_request_from_state LOV4
on LOV4.row_key = fa.from_state_key
where CAL.lagging_count_of_month between 0 and 12
-- and LOV3.source_dimension_name <> 'Canceled'
group by req_num, opened, cr_type, asignee, risk, new_state, old_state, due_date, closed
order by d.change_request_number
--limit 20

select LOV3.source_dimension_name new_state,
(avg(fa.state_duration/86400.0)) state_dur
from (
select cr.*
from ldb.f_problem_state_activity cr
) fa
left join ldb.d_problem d
on fa.problem_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.state_on_key
left join ldb.d_problem_to_state LOV3
on LOV3.row_key = fa.to_state_key 
where CAL.lagging_count_of_month between 0 and 12
group by new_state
order by new_state


select 
d.problem_number prob_num, 
d.short_description shrt,
CI.name CI,
CNT.full_name asignee, 
ORG.organization_name asgn_grp,
LOV1.source_dimension_name priority, 
LOV5.source_dimension_name urgency,
LOV6.source_dimension_name impact,
fa.primary_sequence_id+1 seq,
d.opened_on opened, 
d.closed_on closed,
d.work_start_on act_strt,
d.work_end_on act_end,
null as due_date,
LOV3.source_dimension_name new_state,
coalesce(LOV4.source_dimension_name, 'UNSPECIFIED') old_state,
d.known_error_flag known,
max(d.state_count) state_cnt,
(sum(fa.state_duration)/86400) state_dur
from (
select rt.*
from ldb.f_problem_state_activity rt
join 
(
select  /*max(fcra.primary_sequence_id) seq_id,*/ max(CAL.calendar_date) crtdt, fpa.problem_key, fpa.state_on_key
from ldb.f_problem_state_activity fpa
left join ldb.d_calendar_date CAL
on CAL.row_key = fpa.state_on_key
group by fpa.problem_key, fpa.state_on_key
) SQ
on SQ.state_on_key = rt.state_on_key and SQ.problem_key = rt.problem_key
) fa
left join ldb.d_problem d
on fa.problem_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.state_on_key
left join ldb.d_configuration_item CI
on CI.row_key = fa.configuration_item_key
left join ldb.d_problem_priority LOV1
on LOV1.row_key = fa.priority_src_key
left join ldb.d_internal_contact_assigned_to CNT
on CNT.row_key = fa.assigned_to_key
left join ldb.d_internal_organization_group ORG
on ORG.row_key = fa.assignment_group_key
left join ldb.d_problem_to_state LOV3
on LOV3.row_key = fa.to_state_key
left join ldb.d_problem_from_state LOV4
on LOV4.row_key = fa.from_state_key
left join ldb.d_problem_urgency LOV5
on LOV5.row_key = fa.urgency_src_key
left join ldb.d_problem_impact LOV6
on LOV6.row_key = fa.impact_src_key
where CAL.lagging_count_of_month between 0 and 12
-- and LOV3.source_dimension_name <> 'Canceled'
group by prob_num, CI, shrt, seq, opened, act_strt, act_end, closed, new_state, old_state, priority, urgency, impact, asignee, asgn_grp, due_date, known
order by d.problem_number, shrt
--limit 20

select 
case when fa.to_stage_key = -1 then 'UNKNOWN'
when fa.to_stage_key <> -1 and LOV3.source_dimension_name is null then 'UNSPECIFIED'
else LOV3.source_dimension_name end new_stage,
round(avg(fa.primary_duration/3600.0),0) stage_dur
from (
select cr.*
from ldb.f_request_item_activity cr
) fa
left join ldb.d_request_item d
on fa.request_item_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.changed_on_key
left join ldb.d_request_item_to_stage LOV3
on LOV3.row_key = fa.to_stage_key 
where CAL.lagging_count_of_month between 0 and 12
group by new_stage
order by new_stage
--limit 20

select 
case when fa.to_state_key = -1 then 'UNKNOWN'
when fa.to_state_key <> -1 and LOV3.source_dimension_name is null then 'UNSPECIFIED'
else LOV3.source_dimension_name end new_state,
round(avg(fa.primary_duration/3600.0),0) state_dur
from (
select cr.*
from ldb.f_request_item_activity cr
) fa
left join ldb.d_request_item d
on fa.request_item_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.changed_on_key
left join ldb.d_request_item_to_state LOV3
on LOV3.row_key = fa.to_state_key 
where CAL.lagging_count_of_month between 0 and 12
group by new_state
order by new_state
--limit 20

select 
d.request_item_number req_item_num, 
ITEM.item_name item,
REQ.request_number req_no,
CNT.full_name asignee,
ORG.organization_name dept,
d.opened_on opened, 
d.closed_on closed,
d.due_on as due_date,
LOV3.source_dimension_name new_state,
coalesce(LOV4.source_dimension_name, 'UNSPECIFIED') old_state,
LOV5.source_dimension_name new_stage,
coalesce(LOV6.source_dimension_name, 'UNSPECIFIED') old_stage,
max(d.state_count) state_cnt,
(sum(fa.primary_duration)/3600) state_dur,
round(sum(LOV7.target_duration/86400),0) tgt_dur
from (
select rt.*
from ldb.f_request_item_activity rt
join 
(
select  /*max(fcra.primary_sequence_id) seq_id,*/ max(CAL.calendar_date) crtdt, fria.request_item_key, fria.changed_on_key
from ldb.f_request_item_activity fria
left join ldb.d_calendar_date CAL
on CAL.row_key = fria.changed_on_key
group by fria.request_item_key, fria.changed_on_key
) SQ
on SQ.changed_on_key = rt.changed_on_key and SQ.request_item_key = rt.request_item_key
) fa
left join ldb.d_request_item d
on fa.request_item_key = d.row_key 
left join ldb.d_request REQ
on fa.request_key = REQ.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.changed_on_key
left join ldb.d_master_item ITEM
on ITEM.row_key = fa.item_key
left join ldb.d_internal_contact_assigned_to CNT
on CNT.row_key = fa.assigned_to_key
left join ldb.d_internal_organization_department ORG
on ORG.row_key = fa.opened_by_department_key
left join ldb.d_request_item_to_state LOV3
on LOV3.row_key = fa.to_state_key
left join ldb.d_request_item_from_state LOV4
on LOV4.row_key = fa.from_state_key
left join ldb.d_request_item_to_stage LOV5
on LOV5.row_key = fa.to_state_key
left join ldb.d_request_item_from_stage LOV6
on LOV6.row_key = fa.from_stage_key
left join ldb.d_request_item_stage LOV7
on LOV7.row_key = fa.current_stage_src_key
where CAL.lagging_count_of_month between 0 and 12
group by req_item_num, item, req_no, opened, closed, new_state, old_state, new_stage, old_stage, asignee, dept, due_date
order by d.request_item_number
--limit 20

select 
case when fa.to_stage_key = -1 then 'UNKNOWN'
when fa.to_stage_key <> -1 and LOV3.source_dimension_name is null then 'UNSPECIFIED'
else LOV3.source_dimension_name end new_stage,
round(avg(fa.primary_duration/3600.0),1) stage_dur
from (
select cr.*
from ldb.f_request_activity cr
) fa
left join ldb.d_request d
on fa.request_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.changed_on_key
left join ldb.d_sc_request_to_stage LOV3
on LOV3.row_key = fa.to_stage_key 
where CAL.lagging_count_of_month between 0 and 12
group by new_stage
order by new_stage

select 
case when fa.to_state_key = -1 then 'UNKNOWN'
when fa.to_state_key <> -1 and LOV3.source_dimension_name is null then 'UNSPECIFIED'
else LOV3.source_dimension_name end new_state,
round(avg(fa.primary_duration/3600.0),1) state_dur
from (
select cr.*
from ldb.f_request_activity cr
) fa
left join ldb.d_request d
on fa.request_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.changed_on_key
left join ldb.d_sc_request_to_request_state LOV3
on LOV3.row_key = fa.to_state_key 
where CAL.lagging_count_of_month between 0 and 12
group by new_state
order by new_state

select 
d.request_number req_num, 
d.opened_on opened, 
d.closed_on closed,
d.due_on as due_date,
CNT.full_name asignee,
ORG.organization_name asn_grp,
coalesce(LOV4.source_dimension_name, 'UNSPECIFIED') old_state,
LOV3.source_dimension_name new_state,
coalesce(LOV6.source_dimension_name, 'UNSPECIFIED') old_stage,
LOV5.source_dimension_name new_stage,
max(d.state_count) state_cnt,
(sum(fa.primary_duration)/3600) state_dur
from (
select rt.*
from ldb.f_request_activity rt
join 
(
select  /*max(fra.primary_sequence_id) seq_id,*/ max(CAL.calendar_date) crtdt, fra.request_key, fra.changed_on_key
from ldb.f_request_activity fra
left join ldb.d_calendar_date CAL
on CAL.row_key = fra.changed_on_key
group by fra.request_key, fra.changed_on_key
) SQ
on SQ.changed_on_key = rt.changed_on_key and SQ.request_key = rt.request_key
) fa
left join ldb.d_request d
on fa.request_key = d.row_key 
left join ldb.d_calendar_date CAL
on CAL.row_key = fa.changed_on_key
left join ldb.d_internal_contact_assigned_to CNT
on CNT.row_key = fa.assigned_to_key
left join ldb.d_internal_organization_group ORG
on ORG.row_key = fa.assignment_group_key
left join ldb.d_sc_request_to_request_state LOV3
on LOV3.row_key = fa.to_state_key
left join ldb.d_sc_request_from_request_state LOV4
on LOV4.row_key = fa.from_state_key
left join ldb.d_sc_request_to_stage LOV5
on LOV5.row_key = fa.to_stage_key
left join ldb.d_sc_request_from_stage LOV6
on LOV6.row_key = fa.from_stage_key
where CAL.lagging_count_of_month between 0 and 12
group by req_num, opened, closed, new_state, old_state, new_stage, old_stage, asignee, asn_grp, due_date
order by upper(d.request_number), upper(d.opened_on), upper(d.closed_on), upper(d.due_on), upper(CNT.full_name), upper(ORG.organization_name), upper(coalesce(LOV4.source_dimension_name, 'UNSPECIFIED')),
upper(LOV3.source_dimension_name), upper(LOV5.source_dimension_name), upper(coalesce(LOV6.source_dimension_name, 'UNSPECIFIED'))
--limit 20