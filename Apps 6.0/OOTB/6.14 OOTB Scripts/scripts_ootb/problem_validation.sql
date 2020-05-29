select 
d.problem_number prob_num, 
d.short_description shrt,
CI.name CI,
CNT.full_name asignee, 
ORG.organization_name asgn_grp,
LOV1.dimension_name priority, 
LOV5.dimension_name urgency,
LOV6.dimension_name impact,
fa.primary_sequence_id+1 seq,
d.opened_on opened, 
d.closed_on closed,
d.work_start_on act_strt,
d.work_end_on act_end,
null as due_date,
LOV3.dimension_name new_state,
coalesce(LOV4.dimension_name, 'UNSPECIFIED') old_state,
d.known_error_flag known,
max(d.state_count) state_cnt,
(sum(fa.primary_duration)/86400) state_dur
from (
select rt.*
from #DWH_TABLE_SCHEMA.f_problem_activity rt
join 
(
select max(frta.primary_sequence_id) seq_id, frta.task_key
from #DWH_TABLE_SCHEMA.f_problem_activity frta
group by frta.task_key
) SQ
on SQ.seq_id = rt.primary_sequence_id and SQ.task_key = rt.task_key
) fa
left join #DWH_TABLE_SCHEMA.f_problem f
on f.problem_key = fa.task_key
left join #DWH_TABLE_SCHEMA.d_problem d
on f.problem_key = d.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = fa.created_on_key
left join #DWH_TABLE_SCHEMA.d_configuration_item CI
on CI.row_key = f.configuration_item_key
left join #DWH_TABLE_SCHEMA.d_lov LOV1
on LOV1.row_key = f.priority_src_key and LOV1.dimension_class = 'PRIORITY~PROBLEM'
left join #DWH_TABLE_SCHEMA.d_internal_contact CNT
on CNT.row_key = f.assigned_to_key
left join #DWH_TABLE_SCHEMA.d_internal_organization ORG
on ORG.row_key = f.assignment_group_key
left join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = fa.task_attribute_wh_new_value_key and fa.task_attribute_wh_name = 'problem_state' and LOV3.dimension_class = 'STATE~PROBLEM'
left join #DWH_TABLE_SCHEMA.d_lov LOV4
on LOV4.row_key = fa.task_attribute_wh_old_value_key and fa.task_attribute_wh_name = 'problem_state' and LOV4.dimension_class = 'STATE~PROBLEM'
left join #DWH_TABLE_SCHEMA.d_lov LOV5
on LOV5.row_key = f.urgency_src_key and LOV5.dimension_class = 'URGENCY~PROBLEM'
left join #DWH_TABLE_SCHEMA.d_lov LOV6
on LOV6.row_key = f.impact_src_key and LOV6.dimension_class = 'IMPACT~PROBLEM'
where CAL.lagging_count_of_month between 0 and 12
and f.soft_deleted_flag = 'N'
and fa.task_wh_type = 'problem'
AND fa.task_attribute_wh_name = 'problem_state'
-- and LOV3.dimension_name <> 'Canceled'
group by prob_num, CI, shrt, seq, opened, act_strt, act_end, closed, new_state, old_state, priority, urgency, impact, asignee, asgn_grp, due_date, known
order by d.problem_number, shrt
--limit 20