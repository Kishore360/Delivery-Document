drop table if exists #DWH_TABLE_SCHEMA.defect_state_change_icube_base ;
create table #DWH_TABLE_SCHEMA.defect_state_change_icube_base as
select
PRJ.project_name as project,
PRJ.row_key as project_key,
D.row_key as wi_key,
from_status.dimension_name as prev_state,
from_status.sor_lov_name as prev_scr_state,
status.wi_sts as wi_sts ,
cal_mon.lagging_count_of_month as lagging_count_of_month,
FA.work_item_key,
FA.row_key,
FA.primary_duration,
FA.task_attribute_wh_next_value_key ,
D.work_item_number as work_item_number,
TO_CHAR((D.created_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as detected_on_date,
INTC_RPT.full_name as reported_by,
INTC_ASGN.full_name as assigned_to,
to_status.dimension_name as next_state,
to_status.sor_lov_name as next_scr_state,
status.sor_lov_name as current_sts,
type.sor_lov_name as wi_type,
D.short_description as short_description,
wi_sev.wi_sev as wi_severity,
resolution.sor_lov_name as closed_reason,
def_rt_cause.def_rt_cause as def_rt_cause,
ITE.row_key as fix_ite_key,
ITE.name as fixed_iteration
from #DWH_TABLE_SCHEMA.f_work_item_activity FA
join #DWH_TABLE_SCHEMA.d_work_item D
on FA.work_item_key = D.row_key and FA.task_attribute_wh_name = 'STATUS'
AND FA.soft_deleted_flag = 'N'
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_ASGN
on INTC_ASGN.row_key = D.work_item_assigned_to_key
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_RPT
on INTC_RPT.row_key = D.work_item_reported_by_key
join #DWH_TABLE_SCHEMA.d_iteration ITE
on ITE.row_key = D.iteration_key
join
(
 SELECT lov.*, wh_lov.dimension_code AS wi_res_code, wh_lov.dimension_name AS wi_res, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key AND br.dimension_class = 'RESOLUTION~WORK_ITEM'
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
   where lov.dimension_class = 'RESOLUTION~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_res_code, lov.dimension_name AS wi_res, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) resolution
on resolution.row_key = D.work_item_resolution_src_key
join
(
 SELECT lov.*, lov.dimension_code AS wi_prio_code, lov.dimension_name AS wi_prio
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   where lov.dimension_class = 'PRIORITY~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_prio_code, lov.dimension_name AS wi_prio
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = D.work_item_priority_src_key
join
(
 SELECT lov.*, wh_lov.dimension_code AS wi_type_code, wh_lov.dimension_name AS wi_type, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class =  'TYPE~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_type_code, lov.dimension_name AS wi_type, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) type
on type.row_key = D.work_item_type_src_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS wi_sts_code, wh_lov.dimension_name AS wi_sts, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATUS~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_sts_code, lov.dimension_name AS wi_sts, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) status
on status.row_key = D.work_item_status_src_key
join 
(
 SELECT lov.*, lov.dimension_code AS wi_sev_code, lov.dimension_name AS wi_sev
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   where lov.dimension_class = 'SEVERITY~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_sev_code, lov.dimension_name AS wi_sev
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) wi_sev
on wi_sev.row_key = D.work_item_severity_src_key
join 
(
 SELECT lov.*, lov.dimension_code AS wi_rsn_code, lov.dimension_name AS wi_rsn
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   Where lov.dimension_class = 'REASON~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_rsn_code, lov.dimension_name AS wi_rsn
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) wi_rsn
on wi_rsn.row_key = D.work_item_reason_src_key

join 
(
  
   SELECT lov_workitem_status.*, wh_lov.dimension_code AS from_status_code, wh_lov.dimension_name AS from_status,lov_workitem_status.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov_workitem_status
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov_workitem_status.row_key = br.src_key AND lov_workitem_status.row_key <> 0 AND lov_workitem_status.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov_workitem_status.dimension_class = 'STATUS~WORK_ITEM' 
  OR lov_workitem_status.row_key = 0 OR lov_workitem_status.row_key = -1
) from_status
on from_status.row_key = FA.task_attribute_wh_new_value_key
join 
(
   SELECT lov_workitem_status.*, wh_lov.dimension_code AS to_status_code, wh_lov.dimension_name AS to_status ,lov_workitem_status.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov_workitem_status
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov_workitem_status.row_key = br.src_key AND lov_workitem_status.row_key <> 0 AND lov_workitem_status.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE lov_workitem_status.dimension_class = 'STATUS~WORK_ITEM' 
  OR lov_workitem_status.row_key = 0 OR lov_workitem_status.row_key = -1
) to_status
on to_status.row_key = FA.task_attribute_wh_next_value_key
join 
(
 SELECT lov.*, lov.dimension_code AS def_rt_cause_code, lov.dimension_name AS def_rt_cause 
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   Where lov.dimension_class = 'DEFECT_ROOT_CAUSE~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS def_rt_cause_code, lov.dimension_name AS def_rt_cause 
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) def_rt_cause
on def_rt_cause.row_key = D.defect_root_cause_src_key
join 
(
select calendar_date.* 
   FROM #DWH_TABLE_SCHEMA.d_calendar_date calendar_date
 
) cal
on cal.row_key = FA.started_on_key
join 
(
select calendar_month.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date calendar_month
  WHERE calendar_month.row_key = calendar_month.month_start_date_key AND calendar_month.source_id = 0
) cal_mon
on cal.month_start_date_key = cal_mon.row_key
join #DWH_TABLE_SCHEMA.d_work_item_epic epic
on epic.row_key = D.work_item_epic_key
join #DWH_TABLE_SCHEMA.d_project PRJ
on PRJ.row_key = D.project_key
where type.wi_type_code = 'BUG' and (cal_mon.lagging_count_of_month between 0 and 12 or status.wi_sts = 'IN PROGRESS' or status.wi_sts = 'PROPOSED')