select D_P.name Portfolio_name, 
portfolio_category.dimension_name Portfolio_category,
D.project_name Project_name,
TOP_PRJ.project_name Top_Project_Name,
concat(CAL.month_name_abbreviated::text, concat(' '::text, "substring"(CAL.week_start_date_key::text, 7, 8))) WK,
TO_CHAR((D.actual_end_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') act_end_date,
TO_CHAR((D.actual_start_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') act_strt_date,
TO_CHAR((D.planned_end_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM')  plnd_end_date,
round(sum(F.actual_duration),1) Act_duration,
round(sum(F.planned_duration),1) plnd_duration,
case when sum(F.actual_duration - F.planned_duration) < 0 then '('||cast(round(sum(F.planned_duration - F.actual_duration) * 1.0,1) as varchar(200))||')'
else cast(round(sum(F.actual_duration - F.planned_duration) * 1.0,1)as varchar(200)) end duration_variation,
round(case when sum(case when F.project_key is not null then 1.0 else 0.0 end) = 0.0 then 0.0
else (sum(F.actual_duration) * 1.0/
sum(case when F.project_key is not null then 1.0 else 0.0 end)) end,1) AVG_time_Deliver,
round(case when sum(case when F.project_key is not null then 1.0 else 0.0 end) = 0.0 then 0.0
else (sum(F.planned_duration) * 1.0/
sum(case when F.project_key is not null then 1.0 else 0.0 end)) end,1) AVG_Projected_time_Deliver
from 
(
   Select f.*
   FROM #DWH_TABLE_SCHEMA.f_n_project_task_weekly f
   JOIN #DWH_TABLE_SCHEMA.d_calendar_date cal ON f.n_key = cal.row_key
   JOIN ldb.project_task_helper odf ON f.source_id = odf.source_id
   JOIN #DWH_TABLE_SCHEMA.d_calendar_date calps ON calps.row_key = f.planned_start_on_key
  WHERE f.soft_deleted_flag = 'N'::bpchar AND calps.lagging_count_of_month >= 0 AND calps.lagging_count_of_month <= 23
) F
join #DWH_TABLE_SCHEMA.d_project D
on F.project_key = D.row_key and
F.soft_deleted_flag = 'N' and
F.row_key not in (0,-1) and 
D.soft_deleted_flag = 'N'
join 
(
  Select *
  FROM #DWH_TABLE_SCHEMA.d_service
  WHERE d_service.is_business_service_flag = 'Y' OR d_service.row_key = 0 OR d_service.row_key = -1
)SRVC
on SRVC.row_key = F.business_service_key 
join 
(
   SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.week_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) CAL
on CAL.row_key = f.n_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on F.configuration_item_key = CI.row_key
join #DWH_TABLE_SCHEMA.d_domain DOM
on DOM.row_key = F.domain_key
join #DWH_TABLE_SCHEMA.d_internal_contact DIC
on F.project_manager_key = DIC.row_key
join 
(
 SELECT d_internal_organization.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization
  WHERE d_internal_organization.legal_entity_flag = 'Y' 
  OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
)DIO
on DIO.row_key = F.company_key
join 
(
   SELECT a.*
   FROM #DWH_TABLE_SCHEMA.d_location a
   LEFT JOIN #DWH_TABLE_SCHEMA.d_geography b ON a.geo_key = b.row_key AND a.source_id = b.source_id
) LOC
on LOC.row_key = F.location_key
join 
(
 SELECT d.*
   FROM #DWH_TABLE_SCHEMA.d_project d
  WHERE d.task_type = 'PROJECT' OR d.row_key = 0 OR d.row_key = -1
) parent
on parent.row_key = D.parent_project_key
join 
(
  SELECT *
  FROM #DWH_TABLE_SCHEMA.d_project d
  WHERE d.is_top_flag = 'Y' OR d.row_key = 0 OR d.row_key = -1
) TOP_PRJ
on TOP_PRJ.row_key = D.top_project_key
join #DWH_TABLE_SCHEMA.D_PORTFOLIO D_P
on TOP_PRJ.PORTFOLIO_KEY = D_P.row_key
join
( SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PORTFOLIO' AND br.dimension_type = 'CATEGORY'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) portfolio_category
on portfolio_category.row_key = D_P.PORTFOLIO_CATEGORY_SRC_KEY
join 
(
 SELECT lov.*, br.dimension_wh_code cost_ver_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' 
   AND br.dimension_type = 'COLOR' AND br.dimension_subtype = 'COST_VARIANCE'
UNION 
 SELECT lov.*, null as cost_ver_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) cost_ver_color
on cost_ver_color.row_key = f.cost_variance_color_key
join 
(
 SELECT lov.*, br.dimension_wh_code efrt_ver_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' 
   AND br.dimension_type = 'COLOR' AND br.dimension_subtype = 'EFFORT_VARIANCE'
UNION 
 SELECT lov.*, null as efrt_ver_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) efrt_ver_color
on efrt_ver_color.row_key = f.effort_variance_color_key
join 
(
 SELECT lov.*, br.dimension_wh_code sch_ver_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' 
   AND br.dimension_type = 'COLOR' AND br.dimension_subtype = 'SCHEDULE_VARIANCE'
UNION 
 SELECT lov.*, null as sch_ver_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) sch_ver_color
on sch_ver_color.row_key = f.schedule_variance_color_key
join 
(
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'PRIORITY'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) PRIORITY
on D.project_priority_src_key = PRIORITY.row_key
join 
(
 SELECT lov.*, br.dimension_wh_code state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'STATE'
UNION 
 SELECT lov.*, null as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) STATE
on D.project_state_src_key = STATE.row_key
join 
(
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'RISK'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) RISK
on D.project_risk_src_key= RISK.row_key
join 
(
 SELECT lov.*, br.dimension_wh_code risk_ver_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' 
   AND br.dimension_type = 'COLOR' AND br.dimension_subtype = 'RISK'
UNION 
 SELECT lov.*, null as risk_ver_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) risk_ver_color
on risk_ver_color.row_key = f.project_risk_color_key
where 
F.source_id = 2 and
D_P.row_key not in (0,-1) and
(CAL.lagging_count_of_weeks between 0 and 23)
group by D_P.row_key, Portfolio_name, Portfolio_category, D.row_key, D.Project_name, 
TOP_PRJ.row_key, Top_Project_Name, WK,act_strt_date,act_end_date,plnd_end_date
order by D_P.row_key, lower(D_P.name), D.row_key, lower(D.Project_name), TOP_PRJ.row_key, lower(TOP_PRJ.project_name), WK