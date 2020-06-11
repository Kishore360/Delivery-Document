select  -- F.*,
PROJ.project_name prj_nm,
D.work_item_number wi_num,
type.wi_type wi_typ,
priority.wi_prio wi_priority,
D.priority_deescalated_flag pde_flg,
D.priority_escalated_flag pe_flg,

to_char(count(case when (cal_crtd_mon.lagging_count_of_month between 0 and 12 or status.wi_sts = 'PROPOSED' or status.wi_sts = 'IN PROGRESS') and d.priority_escalated_flag='Y' then F.row_key else null end),'FM999,999,999,999,999')  as priority_escalated_work_item,

to_char(count(case when (cal_crtd_mon.lagging_count_of_month between 0 and 12 or status.wi_sts = 'PROPOSED' or status.wi_sts = 'IN PROGRESS') and d.priority_deescalated_flag='Y' then F.row_key else null end),'FM999,999,999,999,999')  as priority_deescalated_work_item

from #DWH_TABLE_SCHEMA.f_work_item F
join #DWH_TABLE_SCHEMA.d_work_item D
on F.work_item_key = D.row_key and F.soft_deleted_flag = 'N'
join #DWH_TABLE_SCHEMA.d_project PROJ
on F.project_key = PROJ.row_key
join #DWH_TABLE_SCHEMA.d_iteration ITE
on ITE.row_key = D.iteration_key
join
(
 SELECT lov.*, lov.dimension_code AS wi_res_code, lov.dimension_name AS wi_res
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key AND br.dimension_class = 'RESOLUTION~WORK_ITEM'
   where lov.dimension_class = 'RESOLUTION~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_res_code, lov.dimension_name AS wi_res
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
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) cal_crtd
on cal_crtd.row_key = F.created_on_key
/*case when status.wi_sts in ('COMPLETED') then coalesce(F.completed_on_key,0) 
when status.wi_sts in ('RESOLVED') then coalesce(F.work_item_resolved_on_key,0) 
when status.wi_sts in ('IN PROGRESS') then coalesce(F.work_item_work_start_on_key,0) 
else coalesce(F.created_on_key,0) end*/
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_crtd_mon
on cal_crtd.month_start_date_key = cal_crtd_mon.row_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) cal_cmptd
on cal_cmptd.row_key = F.completed_on_key
/*case when status.wi_sts in ('COMPLETED') then coalesce(F.completed_on_key,0) 
when status.wi_sts in ('RESOLVED') then coalesce(F.work_item_resolved_on_key,0) 
when status.wi_sts in ('IN PROGRESS') then coalesce(F.work_item_work_start_on_key,0) 
else coalesce(F.created_on_key,0) end*/
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_cmptd_mon
on cal_cmptd.month_start_date_key = cal_cmptd_mon.row_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) cal_rslvd
on cal_rslvd.row_key = coalesce(F.work_item_resolved_on_key,F.completed_on_key)
/*case when status.wi_sts in ('COMPLETED') then coalesce(F.completed_on_key,0) 
when status.wi_sts in ('RESOLVED') then coalesce(F.work_item_resolved_on_key,0) 
when status.wi_sts in ('IN PROGRESS') then coalesce(F.work_item_work_start_on_key,0) 
else coalesce(F.created_on_key,0) end*/
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_rslvd_mon
on cal_rslvd.month_start_date_key = cal_rslvd_mon.row_key
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) cal_inprog
on cal_inprog.row_key = F.work_item_work_start_on_key
/*case when status.wi_sts in ('COMPLETED') then coalesce(F.completed_on_key,0) 
when status.wi_sts in ('RESOLVED') then coalesce(F.work_item_resolved_on_key,0) 
when status.wi_sts in ('IN PROGRESS') then coalesce(F.work_item_work_start_on_key,0) 
else coalesce(F.created_on_key,0) end*/
left join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_inprog_mon
on cal_inprog.month_start_date_key = cal_inprog_mon.row_key
join
(
 SELECT lov.*, lov.dimension_code AS wi_type_code, lov.dimension_name AS wi_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   where lov.dimension_class = 'TYPE~WORK_ITEM'
UNION 
 SELECT lov.*, lov.dimension_code AS wi_type_code, lov.dimension_name AS wi_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) type
on type.row_key = D.work_item_type_src_key
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
) INTC_RSLVDBY
on INTC_RSLVDBY.row_key = F.work_item_resolved_by_key
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_CLSDBY
on INTC_CLSDBY.row_key = F.work_item_closed_by_key
join 
(
select source_id, max(lastupdated) lstupdt
from #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) fresh
on fresh.source_id = F.source_id
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) curr_cal
on curr_cal.row_id = TO_CHAR((fresh.lstupdt),'YYYYMMDD')
join #DWH_TABLE_SCHEMA.d_work_item_version pv
on pv.row_key = D.earliest_fixed_version_key
join #DWH_TABLE_SCHEMA.d_component prim_comp
on prim_comp.row_key = D.primary_component_key
join 
(
  select project_category.*, project_category.dimension_code AS proj_cat_code, project_category.dimension_name AS proj_cat
  FROM #DWH_TABLE_SCHEMA.d_lov project_category
  WHERE project_category.dimension_class = 'CATEGORY~PROJECT' 
  OR project_category.row_key = 0 OR project_category.row_key = -1
) proj_cat
on proj_cat.row_key = PROJ.project_category_src_key
join 
(
  select project_classification.*, project_classification.dimension_code AS proj_clas_code, project_classification.dimension_name AS proj_clas
  FROM #DWH_TABLE_SCHEMA.d_lov project_classification
  WHERE project_classification.dimension_class = 'CLASSIFICATION~PROJECT' 
  OR project_classification.row_key = 0 OR project_classification.row_key = -1
) proj_clas
on proj_clas.row_key = PROJ.project_classification_src_key
join 
(
select *
from #DWH_TABLE_SCHEMA.d_internal_contact
) INTC_UPDTBY
on INTC_UPDTBY.row_key = D.work_item_updated_by_key
join #DWH_TABLE_SCHEMA.d_work_item_workflow wrkflw
on wrkflw.row_key = D.work_item_workflow_key
join #DWH_TABLE_SCHEMA.d_internal_contact DIC
on DIC.row_key = F.work_item_reported_by_key
where ((cal_crtd_mon.lagging_count_of_month between 0 and 12 or cal_inprog_mon.lagging_count_of_month between 0 and 12 or
cal_cmptd_mon.lagging_count_of_month between 0 and 12 or cal_rslvd_mon.lagging_count_of_month between 0 and 12) or
status.wi_sts = 'PROPOSED' or status.wi_sts = 'IN PROGRESS')
group by PROJ.project_name, D.work_item_number, D.row_id, type.wi_type, priority.wi_prio, D.priority_deescalated_flag, D.priority_escalated_flag
order by upper(PROJ.project_name), D.work_item_number, D.row_id, upper(type.wi_type), upper(priority.wi_prio), upper(D.priority_deescalated_flag), upper(D.priority_escalated_flag)