select case when fa.task_attribute_wh_new_value_key = -1 then 'UNKNOWN'
when fa.task_attribute_wh_new_value_key <> -1 and LOV3.dimension_name is null then 'UNSPECIFIED'
else LOV3.dimension_name end new_state,
(avg(fa.primary_duration)/3600) state_dur
from (
select cr.*
from #DWH_TABLE_SCHEMA.f_request_item_activity cr
/*join 
(
select max(fcra.primary_sequence_id) seq_id, fcra.task_key
from #DWH_TABLE_SCHEMA.f_request_item_activity fcra
group by fcra.task_key
) SQ
on SQ.seq_id = cr.primary_sequence_id and SQ.task_key = cr.task_key*/
) fa
left join #DWH_TABLE_SCHEMA.f_request_item f
on f.request_item_key = fa.task_key
left join #DWH_TABLE_SCHEMA.d_request_item d
on f.request_item_key = d.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = fa.created_on_key
left join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = fa.task_attribute_wh_new_value_key 
and fa.task_attribute_wh_name = 'state' 
and LOV3.dimension_class = 'STATE~SC_REQ_ITEM'
where CAL.lagging_count_of_month <=12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'sc_req_item'
AND fa.task_attribute_wh_name = 'state'
-- and LOV3.dimension_name <> 'Canceled'
group by new_state
order by new_state
--limit 20