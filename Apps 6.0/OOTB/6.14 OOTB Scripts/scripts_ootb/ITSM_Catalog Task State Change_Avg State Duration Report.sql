select from_state.dimension_name old_state,
concat(round((avg(fa.primary_duration)/3600.00),1), ' Hours') avg_state_dur

FROM 
(
select ftt.primary_sequence_id + 1 AS primary_sequence_id, ftt.task_attribute_wh_new_value_key AS task_attribute_wh_new_value_key, 
ftt.task_attribute_wh_next_value_key AS task_attribute_wh_next_value_key, ftt.created_on_key AS created_on_key, 
ftt.primary_duration AS primary_duration, ftt.task_key AS request_task_key, f.assignment_group_key, 
f.assigned_to_key, f.request_key, f.request_item_key, f.priority_src_key, f.approval_state_src_key, 
f.upon_approval_src_key, d.state_count, f.state_src_key AS state_src_key, d.task_type, 
frq.state_src_key AS current_request_item_state_key, frq.stage_src_key AS current_request_item_stage_key,
ftt.task_wh_type
from 
(
select rt.*
from #DWH_TABLE_SCHEMA.f_request_task_activity rt
left join 
(
select max(frta.created_on) crtdt, frta.created_on_key, frta.task_key
from #DWH_TABLE_SCHEMA.f_request_task_activity frta
group by frta.task_key, frta.created_on_key
) SQ
on SQ.created_on_key = rt.created_on_key and SQ.task_key = rt.task_key
) ftt
JOIN #DWH_TABLE_SCHEMA.f_request_task f ON ftt.task_key = f.request_task_key
JOIN #DWH_TABLE_SCHEMA.d_request_task d ON d.row_key = f.request_task_key
JOIN #DWH_TABLE_SCHEMA.f_request_item frq ON frq.row_key = f.request_item_key
  WHERE ftt.task_wh_type::text = 'sc_task'::text AND ftt.task_attribute_wh_name::text = 'state'::text 
  AND f.soft_deleted_flag = 'N'::bpchar
) fa
join #DWH_TABLE_SCHEMA.f_request_task f
on f.request_task_key = fa.request_task_key 
join #DWH_TABLE_SCHEMA.d_request_task d
on f.request_task_key = d.row_key 
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = fa.created_on_key
join #DWH_TABLE_SCHEMA.d_request REQ
on REQ.row_key = fa.request_key
join #DWH_TABLE_SCHEMA.d_request_item REQ_ITEM
on REQ_ITEM.row_key = fa.request_item_key
join 
(
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~SC_TASK'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) PRIORITY
on PRIORITY.row_key = f.priority_src_key 
join #DWH_TABLE_SCHEMA.d_internal_contact CNT
on CNT.row_key = f.assigned_to_key
join 
(
select *
FROM #DWH_TABLE_SCHEMA.d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'
  OR d_internal_organization.row_key = 0 
  OR d_internal_organization.row_key = -1
) ORG
on ORG.row_key = f.assignment_group_key
join 
(
 SELECT lov.*, br.dimension_wh_code as upon_aproval
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'UPON_APPROVAL~SC_TASK'::text
UNION 
 SELECT lov.*, null as upon_aproval
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) upon_aproval
on upon_aproval.row_key = f.upon_approval_src_key 
join 
(
 SELECT lov.*, br.dimension_wh_code from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~SC_TASK'
UNION 
 SELECT lov.*, null as from_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) from_state
on from_state.row_key = fa.task_attribute_wh_new_value_key
join 
(
 SELECT lov.*, br.dimension_wh_code to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~SC_TASK'
UNION 
 SELECT lov.*, null as to_state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) to_state
on to_state.row_key = fa.task_attribute_wh_next_value_key
join 
(
 SELECT lov.*, br.dimension_wh_code state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~SC_TASK'
UNION 
 SELECT lov.*, null as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on state.row_key = f.state_src_key
where CAL.lagging_count_of_month between 0 and 12
-- and fa.soft_deleted_flag = 'N'
and fa.task_wh_type = 'sc_task'
group by old_state
order by old_state;