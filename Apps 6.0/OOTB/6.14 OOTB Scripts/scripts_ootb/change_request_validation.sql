select f.change_request_key key_num,
f.change_request_number req_num, 
d.opened_on opened, 
LOV1.dimension_name cr_type, 
CNT.full_name asignee, 
LOV2.dimension_name risk, 
LOV3.dimension_name new_state,
coalesce(LOV4.dimension_name, 'UNSPECIFIED') old_state,
null as due_date,
d.closed_on closed,
(sum(fa.primary_duration)/3600) state_dur,
max(d.state_count) state_cnt
from (
select cr.*
from #DWH_TABLE_SCHEMA.f_change_request_activity cr
join 
(
select max(fcra.primary_sequence_id) seq_id, fcra.task_key
from #DWH_TABLE_SCHEMA.f_change_request_activity fcra
group by fcra.task_key
) SQ
on SQ.seq_id = cr.primary_sequence_id and SQ.task_key = cr.task_key
) fa
left join #DWH_TABLE_SCHEMA.f_change_request f
on f.change_request_key = fa.task_key
left join #DWH_TABLE_SCHEMA.d_change_request d
on f.change_request_key = d.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = fa.created_on_key
left join #DWH_TABLE_SCHEMA.d_lov LOV1
on LOV1.row_key = d.type_src_key and LOV1.dimension_class = 'TYPE~CHANGE_REQUEST'
left join #DWH_TABLE_SCHEMA.d_internal_contact CNT
on CNT.row_key = d.assigned_to_key
left join #DWH_TABLE_SCHEMA.d_lov LOV2
on LOV2.row_key = d.risk_src_key and LOV2.dimension_class = 'RISK~CHANGE_REQUEST'
left join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = fa.task_attribute_wh_new_value_key and fa.task_attribute_wh_name = 'state' and LOV3.dimension_class = 'STATE~CHANGE_REQUEST'
left join #DWH_TABLE_SCHEMA.d_lov LOV4
on LOV4.row_key = fa.task_attribute_wh_old_value_key and fa.task_attribute_wh_name = 'state' and LOV4.dimension_class = 'STATE~CHANGE_REQUEST'
where CAL.lagging_count_of_month <=12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'change_request'
AND fa.task_attribute_wh_name = 'state'
-- and LOV3.dimension_name <> 'Canceled'
group by key_num, req_num, opened, cr_type, asignee, risk, new_state, old_state, due_date, closed
order by f.change_request_number
--limit 20