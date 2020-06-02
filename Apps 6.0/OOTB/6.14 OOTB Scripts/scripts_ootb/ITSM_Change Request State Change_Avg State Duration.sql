select 
coalesce(LOV3.dimension_name, 'UNSPECIFIED') old_state,
concat(round((avg(fa.primary_duration)/3600.00),0), ' Hours') state_dur
from (
select cr.*
from #DWH_TABLE_SCHEMA.f_change_request_activity cr
join 
(
select max(fcra.created_on) crtdt, fcra.task_key, fcra.created_on_key
from #DWH_TABLE_SCHEMA.f_change_request_activity fcra
group by fcra.task_key, fcra.created_on_key
) SQ
on SQ.created_on_key = cr.created_on_key and SQ.task_key = cr.task_key
) fa
join #DWH_TABLE_SCHEMA.f_change_request f
on f.change_request_key = fa.task_key
join #DWH_TABLE_SCHEMA.d_change_request d
on f.change_request_key = d.row_key 
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = fa.created_on_key
join #DWH_TABLE_SCHEMA.d_lov LOV1 on LOV1.row_key = f.type_src_key
-- LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON LOV1.row_key = br.src_key
--   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'TYPE~CHANGE_REQUEST'
join #DWH_TABLE_SCHEMA.d_internal_contact CNT
on CNT.row_key = d.assigned_to_key
join #DWH_TABLE_SCHEMA.d_lov LOV2
on LOV2.row_key = d.risk_src_key 
and ((LOV2.dimension_class = 'RISK~CHANGE_REQUEST') or (d.risk_src_key in (0,-1)))
join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = fa.task_attribute_wh_new_value_key 
and ((fa.task_attribute_wh_name = 'state' and LOV3.dimension_class = 'STATE~CHANGE_REQUEST') or (fa.task_attribute_wh_new_value_key in (0,-1)))
join #DWH_TABLE_SCHEMA.d_lov LOV4
on LOV4.row_key = fa.task_attribute_wh_next_value_key 
and ((fa.task_attribute_wh_name = 'state' and LOV4.dimension_class = 'STATE~CHANGE_REQUEST') or (fa.task_attribute_wh_next_value_key in (0,-1)))
join #DWH_TABLE_SCHEMA.d_lov LOV5
on LOV5.row_key = f.state_src_key 
and ((LOV5.dimension_class = 'STATE~CHANGE_REQUEST') or (f.state_src_key in (0,-1)))
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'change_request'
-- and fa.task_attribute_wh_name = 'state' 
and LOV3.dimension_class = 'STATE~CHANGE_REQUEST'
group by old_state
order by old_state