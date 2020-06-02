drop table if exists #DWH_TABLE_SCHEMA.work_item_monthly_snapshot_cube;
create table #DWH_TABLE_SCHEMA.work_item_monthly_snapshot_cube AS
select 
F.row_key,
F.work_item_key,
F.n_key,
F.n_date,
D.work_item_number as defect_id, 
ASGNTO.full_name as assigned_to,
priority.wi_prio as business_priority,
resolution.sor_lov_name as resolved_reason,
TO_CHAR(F.n_date,'MM') as months,
resolution.wi_res as resolution,
TO_CHAR(CAL.month_start_date,'YYYY-MM-DD') as month_start_date,
TO_CHAR(CAL.month_end_date,'YYYY-MM-DD') as month_end_date,
TO_CHAR((D.completed_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as completed_dt,
TO_CHAR((D.created_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as detected_on_date,
TO_CHAR((D.work_start_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') in_progress_dt,
TO_CHAR((D.resolved_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as resolved_dt,
TO_CHAR((D.work_item_updated_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as updated_on,
ITE.row_key as ite_key,
ITE.name as last_iteration,
PROJ.project_name as project,
PROJ.row_key as project_key,
F.defect_regression_flag as regression_flag,
F.reopened_flag as reopened_flag,
wi_rsn.wi_rsn as root_cause,
wi_sev.wi_sev as severity,
status.sor_lov_name as src_status,
status.wi_sts as status,
status.wi_sts_code as standard_status,
D.short_description as short_description,
D.description as summary,
D.environment as environment,
INTC_UPDTBY.full_name as updated_by,
D.work_item_number as work_item_number,

-- Metrics --
D.deferred_flag,
D.invalid_flag,
D.tc_defects_created_flag,
D.proposed_flag,
round(F.age_since_creation, 2) age_since_creation,
F.reopened_defect_age,
case when F.invalid_flag = 'N' then 1 else 0 end as valid_defect,
case when F.invalid_flag = 'Y' then 1 else 0 end as invalid_defect,
case when F.defect_regression_flag = 'Y' then 1 else 0 end as regression_defect,
case when F.reopened_flag = 'Y' then 1 else 0 end as reopened_defect,
case when F.row_key is not null then 1 else 0 end as total_defect,
case when F.deferred_flag = 'Y' then 1 else 0 end as deferred_defect,
case when status.wi_sts in ('COMPLETED','RESOLVED') and resolution.wi_res not in ('CANCELLED','DEFERRED') then 1 else 0 end as fixed_defect,
case when status.wi_sts in ('COMPLETED') and resolution.wi_res not in ('CANCELLED') then 1 else 0 end as closed_defect
from #DWH_TABLE_SCHEMA.f_work_item_snapshot_monthly F
join #DWH_TABLE_SCHEMA.d_work_item D
on F.work_item_key = D.row_key
join #DWH_TABLE_SCHEMA.d_iteration ITE
on ITE.row_key = F.work_item_iteration_key
join #DWH_TABLE_SCHEMA.d_internal_contact ASGNTO
on ASGNTO.row_key = F.assigned_to_key
join #DWH_TABLE_SCHEMA.d_project PROJ
on PROJ.row_key = F.project_key
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = F.n_key
join 
(
select calendar_week.*
from #DWH_TABLE_SCHEMA.d_calendar_date calendar_week
  WHERE calendar_week.month_start_date_key = calendar_week.row_key AND calendar_week.source_id = 0
) CALWK
on CALWK.row_key = CAL.month_start_date_key
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
on resolution.row_key = F.work_item_resolution_src_key
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
on priority.row_key = F.work_item_priority_src_key
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
on status.row_key = F.work_item_status_src_key
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
 SELECT lov.*, lov.dimension_code AS wi_sev_code, lov.dimension_name AS wi_sev
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   where lov.dimension_class = 'SEVERITY~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_sev_code, lov.dimension_name AS wi_sev
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) wi_sev
on wi_sev.row_key = F.work_item_severity_src_key
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
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_UPDTBY
on INTC_UPDTBY.row_key = D.work_item_updated_by_key
where type.wi_type_code = 'BUG'  and F.soft_deleted_flag = 'N'
order by F.n_key