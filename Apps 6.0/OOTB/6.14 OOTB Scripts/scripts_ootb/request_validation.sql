select 
d.request_number req_num, 
d.opened_on opened, 
d.closed_on closed,
d.due_on as due_date,
CNT.full_name asignee,
ORG.organization_name asn_grp,
LOV3.dimension_name new_state,
coalesce(LOV4.dimension_name, 'UNSPECIFIED') old_state,
LOV5.dimension_name new_stage,
coalesce(LOV6.dimension_name, 'UNSPECIFIED') old_stage,
max(d.state_count) state_cnt,
(sum(fa.primary_duration)/3600) state_dur
from (
select rt.*
from #DWH_TABLE_SCHEMA.f_request_activity rt
join 
(
select max(frta.primary_sequence_id) seq_id, frta.task_key
from #DWH_TABLE_SCHEMA.f_request_activity frta
group by frta.task_key
) SQ
on SQ.seq_id = rt.primary_sequence_id and SQ.task_key = rt.task_key
) fa
left join #DWH_TABLE_SCHEMA.f_request f
on f.request_key = fa.task_key
left join #DWH_TABLE_SCHEMA.d_request d
on f.request_key = d.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = fa.created_on_key
left join #DWH_TABLE_SCHEMA.d_configuration_item CI
on CI.row_key = f.configuration_item_key
left join #DWH_TABLE_SCHEMA.d_internal_contact CNT
on CNT.row_key = f.assigned_to_key
left join #DWH_TABLE_SCHEMA.d_internal_organization ORG
on ORG.row_key = f.assignment_group_key
left join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = fa.task_attribute_wh_new_value_key and fa.task_attribute_wh_name in ('state', 'request_state') and LOV3.dimension_class = 'REQUEST_STATE~SC_REQUEST'
left join #DWH_TABLE_SCHEMA.d_lov LOV4
on LOV4.row_key = fa.task_attribute_wh_old_value_key and fa.task_attribute_wh_name in ('state', 'request_state') and LOV4.dimension_class = 'REQUEST_STATE~SC_REQUEST'
left join #DWH_TABLE_SCHEMA.d_lov LOV5
on LOV5.row_key = fa.task_attribute_wh_new_value_key and fa.task_attribute_wh_name = 'stage' and LOV5.dimension_class = 'STAGE~SC_REQUEST'
left join #DWH_TABLE_SCHEMA.d_lov LOV6
on LOV6.row_key = fa.task_attribute_wh_old_value_key and fa.task_attribute_wh_name = 'stage' and LOV6.dimension_class = 'STAGE~SC_REQUEST'
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'sc_request'
AND fa.task_attribute_wh_name in ('state', 'stage', 'request_state')
-- and LOV3.dimension_name <> 'Canceled'
group by req_num, opened, closed, new_state, old_state, new_stage, old_stage, asignee, asn_grp, due_date
order by d.request_number
--limit 20