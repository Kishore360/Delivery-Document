drop table if exists  #DWH_TABLE_SCHEMA.defect_icube_base;
create table #DWH_TABLE_SCHEMA.defect_icube_base as
select 
-- attributes --
D.work_item_number as defect_id, 
INTC_ASGN.full_name as assigned_to,
priority.wi_prio as business_priority,
resolution.sor_lov_name as resolved_reason,
TO_CHAR((D.completed_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as completed_dt,
fixed_build.name as fixed_build_name,
def_rt_cause.def_rt_cause as defect_root_cause,
def_typ.def_typ as defect_type,
TO_CHAR((D.created_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as detected_on_date,
ITE.row_key as fix_ite_key,
ITE.name as fixed_iteration,
TO_CHAR((D.work_start_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') in_progress_dt,
PROJ.project_name as project,
PROJ.row_key as project_key,
D.defect_regression_flag as regression_flag,
D.reopened_flag as reopened_flag,
INTC_RPT.full_name as reported_by,
TO_CHAR((D.resolved_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as resolved_dt,
wi_rsk.wi_rsk as wi_risk,
wi_rsn.wi_rsn as root_cause,
wi_sev.wi_sev as severity,
status.wi_sts as status,
status.wi_sts_code as standard_status,
status_category.wi_sts_ctgy as status_category,
D.short_description as short_description,
D.description as summary,
D.environment as environment,
INTC_UPDTBY.full_name as updated_by,
TO_CHAR((D.work_item_updated_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') as updated_on,
D.work_item_number as work_item_number,
coalesce( SQ.age_since_creation,0.00) as close_age_since_creation,
-- Metrics --

round(F.age_since_creation, 2) age_since_creation,
D.deferred_flag,
D.invalid_flag,
D.tc_defects_created_flag,
D.tc_is_executed_flag,
F.time_worked_on,
F.reopened_defect_age,
D.proposed_flag,
resolution.wi_res,
case when D.tc_is_executed_flag = 'Y' then 1 else 0 end as tot_tc_executed,
case when D.invalid_flag = 'N' then 1 else 0 end as valid_defect,
case when D.invalid_flag = 'Y' then 1 else 0 end as invalid_defect,
case when D.defect_regression_flag = 'Y' then 1 else 0 end as regression_defect,
case when D.reopened_flag = 'Y' then 1 else 0 end as reopened_defect,
case when D.row_key is not null then 1 else 0 end as total_defect,
case when D.deferred_flag = 'Y' then 1 else 0 end as deferred_defect,
case when status.wi_sts in ('COMPLETED','RESOLVED') and resolution.wi_res not in ('CANCELLED','DEFERRED') then 1 else 0 end as fixed_defect,
case when status.wi_sts in ('COMPLETED') and resolution.wi_res not in ('CANCELLED') then 1 else 0 end as closed_defect

from #DWH_TABLE_SCHEMA.f_work_item F
join #DWH_TABLE_SCHEMA.d_work_item D
on F.work_item_key = D.row_key and F.soft_deleted_flag = 'N'
join #DWH_TABLE_SCHEMA.d_project PROJ
on F.project_key = PROJ.row_key
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
 SELECT lov.*, lov.dimension_code AS wi_sts_ctgy_code, lov.dimension_name AS wi_sts_ctgy
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   where lov.dimension_class = 'STATUS_CATEGORY~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_sts_ctgy_code, lov.dimension_name AS wi_sts_ctgy
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) status_category
on status_category.row_key = D.work_item_status_category_src_key
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
 SELECT lov.*, lov.dimension_code AS wi_rsk_code, lov.dimension_name AS wi_rsk
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   where lov.dimension_class = 'RISK~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_rsk_code, lov.dimension_name AS wi_rsk
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) wi_rsk
on wi_rsk.row_key = D.work_item_risk_src_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
) cal_crtd
on cal_crtd.row_key = F.created_on_key
left join 
(
select calendar_month.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date calendar_month
  WHERE calendar_month.row_key = calendar_month.month_start_date_key AND calendar_month.source_id = 0
) cal_crtd_mon
on cal_crtd.month_start_date_key = cal_crtd_mon.row_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
) cal_cmptd
on cal_cmptd.row_key = F.completed_on_key and resolution.wi_res <> 'CANCELLED'
left join 
(
select calendar_month.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date calendar_month
  WHERE calendar_month.row_key = calendar_month.month_start_date_key AND calendar_month.source_id = 0
) cal_cmptd_mon
on cal_cmptd.month_start_date_key = cal_cmptd_mon.row_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
) cal_rslvd
on cal_rslvd.row_key = coalesce(F.work_item_resolved_on_key,F.completed_on_key) and resolution.wi_res <> 'CANCELLED'
left join 
(
select calendar_month.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date calendar_month
  WHERE calendar_month.row_key = calendar_month.month_start_date_key AND calendar_month.source_id = 0
) cal_rslvd_mon
on cal_rslvd.month_start_date_key = cal_rslvd_mon.row_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
) cal_inprog
on cal_inprog.row_key = F.work_item_work_start_on_key
left join 
(
select calendar_month.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date calendar_month
  WHERE calendar_month.row_key = calendar_month.month_start_date_key AND calendar_month.source_id = 0
) cal_inprog_mon
on cal_inprog.month_start_date_key = cal_inprog_mon.row_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
) cal_cancld
on cal_cancld.row_key = COALESCE(F.work_item_cancelled_on_key, F.completed_on_key, F.work_item_resolved_on_key) and (resolution.wi_res = 'CANCELLED' or status.wi_sts in ('CANCELLED'))
left join 
(
select calendar_month.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date calendar_month
  WHERE calendar_month.row_key = calendar_month.month_start_date_key AND calendar_month.source_id = 0
) cal_cancld_mon
on cal_cancld.month_start_date_key = cal_cancld_mon.row_key
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_ASGN
on INTC_ASGN.row_key = F.work_item_assigned_to_key
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_RPT
on INTC_RPT.row_key = F.work_item_reported_by_key
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_CRT
on INTC_CRT.row_key = F.created_by_key
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_UPDTBY
on INTC_UPDTBY.row_key = D.work_item_updated_by_key
join 
(
select source_id, max(lastupdated) lstupdt
from #DWH_TABLE_SCHEMA.d_o_data_freshness
-- where soft_deleted_flag <> 'Y'
group by source_id
) fresh
on fresh.source_id = F.source_id
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
) curr_cal
on curr_cal.row_id = TO_CHAR((fresh.lstupdt),'YYYYMMDD')
join #DWH_TABLE_SCHEMA.d_build_run fixed_build
on D.defect_fixed_build_run_key = fixed_build.row_key
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
 SELECT lov.*, lov.dimension_code AS def_typ_code, lov.dimension_name AS def_typ
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   where lov.dimension_class = 'DEFECT_TYPE~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS def_typ_code, lov.dimension_name AS def_typ
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) def_typ
on def_typ.row_key = D.defect_type_src_key
left join
(select FW.work_item_key,status.wi_sts_code,FW.age_since_creation from 
#DWH_TABLE_SCHEMA.f_work_item FW 
join #DWH_TABLE_SCHEMA.d_work_item DW
on FW.work_item_key = DW.row_key and FW.soft_deleted_flag = 'N'
join 
(SELECT lov.*, wh_lov.dimension_code AS wi_sts_code, wh_lov.dimension_name AS wi_sts, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATUS~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_sts_code, lov.dimension_name AS wi_sts, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) status
on status.row_key = DW.work_item_status_src_key
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
on resolution.row_key = DW.work_item_resolution_src_key
where status.wi_sts_code ='COMPLETED' and resolution.wi_res not in ('CANCELLED') ) SQ
on SQ.work_item_key = F.work_item_key
where type.wi_type_code = 'BUG' and
((cal_crtd_mon.lagging_count_of_month between 0 and 12 or cal_inprog_mon.lagging_count_of_month between 0 and 12 or
cal_cmptd_mon.lagging_count_of_month between 0 and 12 or cal_rslvd_mon.lagging_count_of_month between 0 and 12 or 
cal_cancld_mon.lagging_count_of_month between 0 and 12) or
status.wi_sts = 'PROPOSED' or status.wi_sts = 'IN PROGRESS')
order by D.work_item_number;