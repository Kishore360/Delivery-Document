select f.request_task_key key_num,
d.request_task_number req_num, 
REQ.request_number req,
REQ_ITEM.request_item_number req_item,
d.short_description shrt,
d.opened_on opened, 
d.work_start_on act_strt,
d.work_end_on act_end,
d.closed_on closed,
LOV3.dimension_name new_state,
coalesce(LOV4.dimension_name, 'UNSPECIFIED') old_state,
LOV1.dimension_name priority, 
CNT.full_name asignee, 
ORG.organization_name asgn_grp,
null as due_date,

(sum(fa.primary_duration)/3600) state_dur,
max(d.state_count) state_cnt
from (
select rt.*
from #DWH_TABLE_SCHEMA.f_request_task_activity rt
join 
(
select  /*max(frta.primary_sequence_id) seq_id,*/ max(frta.created_on) crtdt, frta.task_key
from #DWH_TABLE_SCHEMA.f_request_task_activity frta
group by frta.task_key
) SQ
on SQ.crtdt = rt.created_on and SQ.task_key = rt.task_key
-- SQ.seq_id = rt.primary_sequence_id and SQ.task_key = rt.task_key
) fa
left join #DWH_TABLE_SCHEMA.f_request_task f
on f.request_task_key = fa.task_key
left join #DWH_TABLE_SCHEMA.d_request_task d
on f.request_task_key = d.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = fa.created_on_key
left join #DWH_TABLE_SCHEMA.d_request REQ
on REQ.row_key = f.request_key
left join #DWH_TABLE_SCHEMA.d_request_item REQ_ITEM
on REQ_ITEM.row_key = f.request_item_key
left join #DWH_TABLE_SCHEMA.d_lov LOV1
on LOV1.row_key = f.priority_src_key and LOV1.dimension_class = 'PRIORITY~SC_TASK'
left join #DWH_TABLE_SCHEMA.d_internal_contact CNT
on CNT.row_key = f.assigned_to_key
left join #DWH_TABLE_SCHEMA.d_internal_organization ORG
on ORG.row_key = f.assignment_group_key
left join #DWH_TABLE_SCHEMA.d_lov LOV2
on LOV2.row_key = f.upon_approval_src_key and LOV2.dimension_class = 'UPON_APPROVAL~SC_TASK'
left join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = fa.task_attribute_wh_new_value_key and fa.task_attribute_wh_name = 'state' and LOV3.dimension_class = 'STATE~SC_TASK'
left join #DWH_TABLE_SCHEMA.d_lov LOV4
on LOV4.row_key = fa.task_attribute_wh_old_value_key and fa.task_attribute_wh_name = 'state' and LOV4.dimension_class = 'STATE~SC_TASK'
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'sc_task'
AND fa.task_attribute_wh_name = 'state'
-- and LOV3.dimension_name <> 'Canceled'
group by key_num, req_num, req, req_item, shrt, opened, act_strt, act_end, closed, new_state, old_state, priority, asignee, asgn_grp, due_date
order by d.request_task_number
--limit 20