select D_P.name Portfolio_name, 
case when D_P.PORTFOLIO_CATEGORY_SRC_KEY is null or D_P.PORTFOLIO_CATEGORY_SRC_KEY = 0 then 'UNSPECIFIED' 
when (portfolio_category.row_key <> D_P.PORTFOLIO_CATEGORY_SRC_KEY and D_P.PORTFOLIO_CATEGORY_SRC_KEY is not null) or (D_P.PORTFOLIO_CATEGORY_SRC_KEY = -1) then 'UNKNOWN'
else portfolio_category.dimension_name end Portfolio_category,
D.project_name Project_name,
D2.project_name Top_Project_Name,
DIC_PM.full_name Project_Manager,
STATE.dimension_name Status_src,
STATE.STATE Project_status_std,
PARENT.project_name Parent_project_name,
round(COALESCE(f.sub_project_count, 0::numeric),0) sub_proj,
CI.name CI_name,
APP.name appl_name,
SRVC.name BS_name,
DIO_LEG.organization_name as comp_name,

DOM.domain_name dom_name,

LOC.location_name as Loc_name,

case when F.project_risk_color_key = 0 or F.project_risk_color_key is null then 'UNSPECIFIED'
when F.project_risk_color_key = -1 or (F.project_risk_color_key is not null and risk_color.row_key <> F.project_risk_color_key) then 'UNKNOWN'
else risk_color.risk_color end risk_color_data,

max(case when F.project_risk_color_key = 0 or F.project_risk_color_key is null then 'UNSPECIFIED'
when F.project_risk_color_key = -1 or (F.project_risk_color_key is not null and risk_color.row_key <> F.project_risk_color_key) then 'UNKNOWN'
else risk_color.risk_color_code end) risk,

case when round((sum(F.risk_doc_cost)),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round(((sum(F.risk_doc_cost))/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round((sum(F.risk_doc_cost))),0), '9,999,999,999')))) end risk_cost

from 
(
 SELECT f.*
   FROM #DWH_TABLE_SCHEMA.f_project_task f
  WHERE f.soft_deleted_flag = 'N'
) F
join #DWH_TABLE_SCHEMA.d_project D
on F.project_key = D.row_key and F.soft_deleted_flag = 'N'
join 
(
   select * 
   FROM #DWH_TABLE_SCHEMA.d_application
) APP
on APP.row_key = F.application_key
join
(
   SELECT d_service.*
   FROM #DWH_TABLE_SCHEMA.d_service
   WHERE d_service.is_business_service_flag = 'Y' OR d_service.row_key = 0 OR d_service.row_key = -1
) SRVC
on SRVC.row_key = F.business_service_key
join 
(
   SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
)CAL
on CAL.row_key = F.planned_start_on_key
join
(
select *
FROM #DWH_TABLE_SCHEMA.d_configuration_item
) CI
on CI.row_key = F.configuration_item_key
join
(
SELECT *
FROM #DWH_TABLE_SCHEMA.d_domain
) DOM
on DOM.row_key = F.domain_key
join
(
  select *
  FROM #DWH_TABLE_SCHEMA.d_internal_contact
) DIC_PM
on DIC_PM.row_key = F.project_manager_key
join
(
  SELECT d_internal_organization.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization
  WHERE d_internal_organization.legal_entity_flag = 'Y' OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
) DIO_LEG
on DIO_LEG.row_key = F.company_key
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
  WHERE d.is_top_flag = 'Y' OR d.row_key = 0 OR d.row_key = -1
) D2
on D.top_project_key = D2.row_key
join #DWH_TABLE_SCHEMA.D_PORTFOLIO D_P
on D2.PORTFOLIO_KEY = D_P.row_key
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
( SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'APPROVAL'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) approve
on D.project_approval_src_key = approve.row_key
join 
( SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'CONTACT_TYPE'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) contact_type
on D.project_contact_type_src_key = contact_type.row_key
join
(
 SELECT lov.*, br.dimension_wh_code cost_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'COLOR' AND br.dimension_subtype = 'COST_VARIANCE'
UNION 
 SELECT lov.*, lov.dimension_name as cost_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) cost_color
on cost_color.row_key = F.cost_variance_color_key
join
(
 SELECT lov.*, br.dimension_wh_code effort_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'COLOR' AND br.dimension_subtype = 'EFFORT_VARIANCE'
UNION 
 SELECT lov.*, lov.dimension_name as effort_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) effort_color
on effort_color.row_key = F.effort_variance_color_key
join 
( SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'ESCALATION'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) ESCALATION
on D.project_escalation_src_key = ESCALATION.row_key
join 
(
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'IMPACT'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) IMPACT
on D.project_impact_src_key = IMPACT.row_key
join 
(
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'PHASE_TYPE'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) PHASE_TYPE
on D.project_phase_type_src_key = PHASE_TYPE.row_key
join 
(
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'PHASE'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) PHASE
on D.project_phase_src_key = PHASE.row_key
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
   SELECT lov.*, wh_lov.dimension_name risk_color, br.dimension_wh_code risk_color_code
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'COLOR' AND br.dimension_subtype = 'RISK'
UNION 
 SELECT lov.*, lov.dimension_name as risk_color, lov.dimension_code risk_color_code
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) risk_color
on risk_color.row_key = F.project_risk_color_key
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
 SELECT lov.*, br.dimension_wh_code schedule_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'COLOR' AND br.dimension_subtype = 'SCHEDULE_VARIANCE'
UNION 
 SELECT lov.*, lov.dimension_name as schedule_color
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) schedule_color
on schedule_color.row_key = F.schedule_variance_color_key
join 
(
 SELECT lov.*, wh_lov.dimension_name state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'STATE'
UNION 
 SELECT lov.*, lov.dimension_name as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) STATE
on D.project_state_src_key = STATE.row_key

join  
(
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PROJECT' AND br.dimension_type = 'URGENCY'
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) URGENCY
on D.project_urgency_src_key = URGENCY.row_key
join 
(
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.dimension_class::text = 'PROJECT'::text AND lov.dimension_type::text = 'WEEK_BUCKET'::text 
  AND lov.dimension_subtype::text = 'TO_DUE_DATE'::text
UNION 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
)weeks_to_due_date_bucket
on F.weeks_to_due_date_bucket_key = weeks_to_due_date_bucket.row_key
join 
(
 SELECT d.*
   FROM #DWH_TABLE_SCHEMA.d_project d
  WHERE d.task_type = 'PROJECT' OR d.row_key = 0 OR d.row_key = -1
) parent
on parent.row_key = D.parent_project_key
where 
(CAL.lagging_count_of_year = 0 or 
CAL.lagging_count_of_month between 0 and 23) and
F.source_id = 2 and 
D_p.row_key not in (0,-1) 
and F.soft_deleted_flag = 'N'
group by D_P.name , D_P.row_key,Portfolio_category ,D.project_name , D.row_key,D2.project_name, D2.row_key, Parent_project_name, 
Project_Manager,Status_src,Project_status_std,appl_name,BS_name,CI_name,comp_name,dom_name,Loc_name,sub_proj,risk_color_data
order by D_P.row_key, lower(D_P.name), D.row_key, lower(D.Project_name), D2.row_key, lower(D2.project_name);