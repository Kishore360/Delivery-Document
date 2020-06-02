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
round(max(LOV7.target_duration/86400),0) tgt_dur
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
join ldb.d_request_item_stage LOV7
on LOV7.row_key = fa.current_stage_src_key
where CAL.lagging_count_of_month between 0 and 12
group by req_item_num, item, req_no, opened, closed, new_state, old_state, new_stage, old_stage, asignee, dept, due_date
order by d.request_item_number
--limit 20