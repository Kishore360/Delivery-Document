select concat(concat(CAL_MONTH.month_name_abbreviated,' '), CAL_MONTH.year_name), ORG_GRP.organization_name AS Assignment_Group,                              
   trim(to_char(sum(case when di.backlog_flag ='Y' then 1 else 0 end ),'9,99,99,990')) AS Incident_Backlog,
       sum(case when SM.reopened_flag ='Y' then 1 else 0 end) AS Incident_Backlog_Reopen                                 
from 
(
  select *
  FROM #DWH_TABLE_SCHEMA.f_n_incident_monthly
  WHERE f_n_incident_monthly.soft_deleted_flag = 'N'
) SM
join #DWH_TABLE_SCHEMA.d_incident di
on di.row_key = SM.incident_key
join
(
  select DIO.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization DIO
  WHERE DIO.group_flag = 'Y'::bpchar OR DIO.row_key = 0 OR DIO.row_key = -1
) ORG_GRP
on ORG_GRP.row_key = SM.assignment_group_key
 join 
(
   select d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL_DATE
on SM.n_key = CAL_DATE.row_key
 join 
(
   select d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
   WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) CAL_MONTH
on CAL_DATE.month_start_date_key = CAL_MONTH.row_key
/* join
(
SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~INCIDENT'::text
UNION ALL 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on state.row_key = SM.state_src_key*/
join
(
  select d_service.*
  FROM #DWH_TABLE_SCHEMA.d_service
  WHERE d_service.is_business_service_flag = 'Y'::bpchar OR d_service.row_key = 0 OR d_service.row_key = -1
) SRVC
on SRVC.row_key = SM.business_service_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on SM.configuration_item_key = CI.row_key
join
(
  select lov.*
  FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.dimension_class::text = 'CATEGORY~INCIDENT'::text OR lov.row_key = -1 OR lov.row_key = 0
) CAT
on SM.category_src_key = CAT.row_key
 join
(
   select lov.*, br.dimension_wh_code priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~INCIDENT'::text
UNION 
 SELECT lov.*, lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = SM.priority_src_key
 join #DWH_TABLE_SCHEMA.d_internal_contact DIC
on DIC.row_key = SM.opened_by_key
join #DWH_TABLE_SCHEMA.d_internal_contact ASGN
on ASGN.row_key = SM.assigned_to_key
join
(
  SELECT DIC.*
  FROM #DWH_TABLE_SCHEMA.d_internal_contact DIC
  WHERE DIC.current_flag = 'Y'
) MDM
on MDM.row_key = DIC.row_current_key
join 
(
  select DIO.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization DIO
  WHERE DIO.department_flag = 'Y' OR DIO.row_key = 0 OR DIO.row_key = -1
) ORG_DEPT
on ORG_DEPT.row_key = SM.opened_by_department_key
where SM.soft_deleted_flag='N' 
--and ORG_GRP.organization_name<> 'UNKNOWN'
group by  CAL_MONTH.month_name_abbreviated, CAL_MONTH.month_id,CAL_MONTH.year_name,ORG_GRP.row_key,ORG_GRP.organization_name
order by CAL_MONTH.month_id desc,CAL_MONTH.month_name_abbreviated,CAL_MONTH.year_name,ORG_GRP.row_key,lower(ORG_GRP.organization_name)