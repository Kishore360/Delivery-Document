select F.project,F.work_item_number,
F.assigned_to,
F.reported_by,
F.closed_reason,
F.fix_ite_key,
F.fixed_iteration,
F.def_rt_cause,
F.wi_severity,
F.short_description,
F.wi_type,
F.current_sts,
F.closed_reason,
case when 
count(CASE WHEN (F.task_attribute_wh_next_value_key <> 0 and
(F.wi_sts = 'PROPOSED' or F.wi_sts = 'IN PROGRESS' or F.lagging_count_of_month between 0 and 12))
THEN F.row_key ELSE NULL END) = 0 then '' else
cast(count(CASE WHEN (F.task_attribute_wh_next_value_key <> 0 and
(F.wi_sts = 'PROPOSED' or F.wi_sts = 'IN PROGRESS' or F.lagging_count_of_month between 0 and 12))
THEN F.row_key ELSE NULL END) as varchar(50) ) end AS state_chang_count
from #DWH_TABLE_SCHEMA.defect_state_change_icube_base F
group by F.project, F.work_item_number,F.assigned_to,F.reported_by,F.closed_reason,F.fix_ite_key,F.fixed_iteration,F.def_rt_cause,F.wi_severity,F.short_description,
F.wi_type,F.current_sts,F.closed_reason
order by lower(F.project),F.work_item_number,F.assigned_to,F.reported_by,F.closed_reason,F.fix_ite_key,F.fixed_iteration,F.def_rt_cause,F.wi_severity,F.short_description,
F.wi_type,F.current_sts,F.closed_reason