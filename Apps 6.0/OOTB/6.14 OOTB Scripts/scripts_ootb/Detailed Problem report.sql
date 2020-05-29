select dc.full_name as "Assignee" , dc1.full_name as "employee", 
dp.knowledge_flag as "Knowledge", dp.known_error_flag as "Known error",  '' as metrics,
sum(case when dp.over_due_flag='Y' then 1 else 0 end) as " Overdue Problems",
concat(round(sum(case when dp.over_due_flag='Y' then 1 else 0 end)*100.00/count(fp.row_key),0),'%') as "Overdue Problems%",
sum(case when dp.priority_escalated_flag='Y' then 1 else 0 end) as "Priority Escated Problems",
trim(to_char(sum(case when dp.known_error_flag='Y' then 1 else 0 end),'999,999,990')) as "Known Errors"
from
#DWH_TABLE_SCHEMA.f_problem fp
left JOIN(
SELECT ic.secondary2_changed_on, ic.gender_code, ic.service_rep_flag, ic.email_address, ic.st_address4, ic.manager_id, ic.time_zone, ic.expense_user, ic.dw_updated_on, ic.created_by, ic.effective_from, ic.dw_inserted_on, ic.first_name, ic.contact_active_flag, ic.source_id, ic.middle_name, ic.role_id, ic.full_name, ic.country_code, ic.department_key, ic.preferred_language, ic.postal_code, ic.sales_rep_flag, ic.identification_number, ic.department_code, ic.city_code, ic.cost_center, ic.effective_to, ic.business_hours_per_day, ic.secondary1_changed_on, ic.changed_on, ic.row_id, ic.created_on, ic.st_address2, ic.st_address3, ic.title, ic.row_dn_key, ic.soft_deleted_flag, ic.parent_row_id, ic.etl_run_number, ic.company_name, ic.state_code, ic.manager_key, ic.mobile_number, ic.vip_flag, ic.mdm_id, ic.current_flag, ic.work_phone, ic.changed_by, ic.location_key, ic.row_current_key, ic.pivot_date, ic.geo_key, ic.employment_type, ic.row_key, ic.cost_center_key, ic.st_address1, ic.cdctype, ic.last_name, ic.user_name, icm.full_name AS manager_name
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key) dc
   on dc.row_key= fp.assigned_to_key
   left join #DWH_TABLE_SCHEMA.d_internal_contact dc1
on fp.opened_by_key= dc1.row_key
left join #DWH_TABLE_SCHEMA.d_problem dp
on fp.problem_key = dp.row_key
--left join #DWH_TABLE_SCHEMA.d_internal_organization dio
--on fp.opened_by_department_key = dio.row_key
/*left join(
SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~PROBLEM'
UNION ALL 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) p_state
  on p_state.row_key = fp.state_src_key*/
/*left join #DWH_TABLE_SCHEMA.d_lov dv
on dv.row_key = fp.state_src_key
left join #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class*/
--left join #DWH_TABLE_SCHEMA.d_internal_contact dc
--on fp.assigned_to_key = dc.row_key
left join 
(
SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL
on cal.row_key = fp.opened_on_key
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
on CAL.month_start_date_key = cal_mon.row_key
--left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
--on dcd.row_key = fp.opened_on_key
--left join #DWH_TABLE_SCHEMA.d_calendar_time dct
--on fp.opened_time_key = dct.row_key
group by dc.full_name,dc1.full_name,dp.known_error_flag ,dp.knowledge_flag,dc.row_key,dc1.row_key
 order by dc.row_key asc,dc.full_name,dc1.row_key asc,dp.known_error_flag ,dp.knowledge_flag