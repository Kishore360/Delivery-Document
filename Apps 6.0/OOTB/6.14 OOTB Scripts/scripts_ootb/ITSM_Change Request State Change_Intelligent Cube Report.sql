select 
f.change_request_number CR, 
f.change_request_number chng_req_num, 
coalesce(TO_CHAR(d.opened_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') opened, 
-- LOV1.source_dimension_name cr_type, 
LOV1.dimension_name cr_type, 
CNT.full_name asignee, 
LOV2.dimension_name risk, 
coalesce(LOV5.dimension_name, 'UNSPECIFIED') curr_state,
coalesce(LOV4.dimension_name, 'UNSPECIFIED') new_state,
coalesce(LOV3.dimension_name, 'UNSPECIFIED') old_state,
coalesce(TO_CHAR(d.due_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'')  as due_date,
coalesce(TO_CHAR(d.closed_on,'fmMM/fmDD/YYYY fmHH:MI:SS AM'),'') closed,
concat(
case when (max(fa.primary_duration)/3600.00) < 0 
then '-'||cast(coalesce(round((max(fa.primary_duration * (-1))/3600.00),0),0) as varchar)
else cast(coalesce(round((max(fa.primary_duration)/3600.00),0),0) as varchar) end, ' Hours') state_dur,
max(d.state_count) state_cnt
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
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON LOV1.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'TYPE~CHANGE_REQUEST'
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
-- AND fa.task_attribute_wh_name = 'state'
-- and LOV3.dimension_name <> 'Canceled'
group by CR, chng_req_num, d.opened_on, cr_type, asignee, risk, curr_state, new_state, old_state, d.due_on, d.closed_on
order by CR, chng_req_num, d.opened_on, cr_type, asignee, risk, curr_state, new_state, old_state, d.due_on, d.closed_on