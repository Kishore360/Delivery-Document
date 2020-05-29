select concat(concat(CAL_MONTH.month_name_abbreviated,' '), CAL_MONTH.year_name),ORG_DEPT.organization_name AS Department,
    trim(to_char(sum(case when d.backlog_flag='Y' then 1 else 0 end ),'9,99,99,990')) AS Incident_Backlog,
	trim(to_char(round(max(SM.age)*1.00/86400,1),'9,99,99,990D9')) AS Max_Incident_Age,		
	trim(to_char(round(min(SM.age)*1.00/86400,1),'9,99,99,990D9')) AS Min_Incident_Age,		
  round(sum(SM.age)*1.00/(count(SM.incident_key)*86400),1) Average_Age                              
from 
(
  select *
  FROM #DWH_TABLE_SCHEMA.f_n_incident_monthly
  WHERE f_n_incident_monthly.soft_deleted_flag = 'N'
) SM
left join 
#DWH_TABLE_SCHEMA.d_incident d
on d.row_key = SM.incident_key
join
(
  select d_service.*
  FROM #DWH_TABLE_SCHEMA.d_service
  WHERE d_service.is_business_service_flag = 'Y'::bpchar OR d_service.row_key = 0 OR d_service.row_key = -1
) SRVC
on SRVC.row_key = SM.business_service_key
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
/*join
(
SELECT lov.*, br.dimension_wh_code as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~INCIDENT'::text
UNION ALL 
 SELECT lov.*, lov.dimension_name as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on state.row_key = SM.state_src_key*/
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
join
(
  select DIO.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization DIO
  WHERE DIO.group_flag = 'Y'::bpchar OR DIO.row_key = 0 OR DIO.row_key = -1
) ORG_GRP
on ORG_GRP.row_key = SM.assignment_group_key
where SM.soft_deleted_flag='N' 
--and ORG_GRP.organization_name<> 'UNKNOWN'
group by  CAL_MONTH.month_name_abbreviated, CAL_MONTH.month_id,CAL_MONTH.year_name,ORG_DEPT.row_key,ORG_DEPT.organization_name
order by CAL_MONTH.month_id desc,CAL_MONTH.month_name_abbreviated,CAL_MONTH.year_name,ORG_DEPT.organization_name
