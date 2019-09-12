select 'configuration_item_key '   as Table_Name, 
COUNT(configuration_item_key ) AS TotalRows,
COUNT(DISTINCT configuration_item_key  ) AS DistinctValues, 
sum(case when configuration_item_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when configuration_item_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_configuration_item       a12
on (a11.configuration_item_key = a12.row_key)
UNION 
select 'assigned_to_key '   as Table_Name, 
COUNT(assigned_to_key ) AS TotalRows,
COUNT(DISTINCT assigned_to_key  ) AS DistinctValues, 
sum(case when assigned_to_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when assigned_to_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key = a13.row_key)
UNION 
select 'assignment_group_key '   as Table_Name, 
COUNT(assignment_group_key ) AS TotalRows,
COUNT(DISTINCT assignment_group_key  ) AS DistinctValues, 
sum(case when assignment_group_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when assignment_group_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
UNION 
select 'business_service_key '   as Table_Name, 
COUNT(business_service_key ) AS TotalRows,
COUNT(DISTINCT business_service_key  ) AS DistinctValues, 
sum(case when business_service_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when business_service_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_business_service       a15
on (a11.business_service_key = a15.row_key)
UNION 
select 'date_key '   as Table_Name, 
COUNT(date_key ) AS TotalRows,
COUNT(DISTINCT date_key  ) AS DistinctValues, 
sum(case when date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date       a16
on (a11.date_key = a16.row_key)
UNION 
select 'month_start_date_key '   as Table_Name, 
COUNT(month_start_date_key ) AS TotalRows,
COUNT(DISTINCT month_start_date_key  ) AS DistinctValues, 
sum(case when month_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when month_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11
join ldb.d_calendar_date       a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month       a17
on (a16.month_start_date_key = a17.row_key)
UNION 
select 'week_start_date_key '   as Table_Name, 
COUNT(week_start_date_key ) AS TotalRows,
COUNT(DISTINCT week_start_date_key  ) AS DistinctValues, 
sum(case when week_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when week_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11
join ldb.d_calendar_date       a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_week       a121
on (a16.week_start_date_key = a121.row_key)
UNION 
select 'quarter_start_date_key '   as Table_Name, 
COUNT(quarter_start_date_key ) AS TotalRows,
COUNT(DISTINCT quarter_start_date_key  ) AS DistinctValues, 
sum(case when quarter_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when quarter_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date       a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month       a17
on (a16.month_start_date_key = a17.row_key)
join ldb.d_calendar_quarter       a18
on (a17.quarter_start_date_key = a18.row_key)
UNION 
select 'year_start_date_key '   as Table_Name, 
COUNT(year_start_date_key ) AS TotalRows,
COUNT(DISTINCT year_start_date_key  ) AS DistinctValues, 
sum(case when year_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when year_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11
join ldb.d_calendar_date       a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month       a17
on (a16.month_start_date_key = a17.row_key)
join ldb.d_calendar_quarter       a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_calendar_year       a122
on (a18.year_start_date_key = a122.row_key)
UNION 
select 'incident_key '   as Table_Name, 
COUNT(incident_key ) AS TotalRows,
COUNT(DISTINCT incident_key  ) AS DistinctValues, 
sum(case when incident_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when incident_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
UNION 
select 'caused_by_change_key '   as Table_Name, 
COUNT(caused_by_change_key ) AS TotalRows,
COUNT(DISTINCT caused_by_change_key  ) AS DistinctValues, 
sum(case when caused_by_change_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when caused_by_change_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_change_request_caused_by       a110
on (a11.caused_by_change_key = a110.row_key)
UNION 
select 'change_request_key '   as Table_Name, 
COUNT(change_request_key ) AS TotalRows,
COUNT(DISTINCT change_request_key  ) AS DistinctValues, 
sum(case when change_request_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when change_request_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_change_request       a111
on (a11.change_request_key = a111.row_key)
UNION 
select 'customer_key '   as Table_Name, 
COUNT(customer_key ) AS TotalRows,
COUNT(DISTINCT customer_key  ) AS DistinctValues, 
sum(case when customer_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when customer_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_customer       a112
on (a11.customer_key = a112.row_key)
UNION 
select 'employee_key '   as Table_Name, 
COUNT(employee_key ) AS TotalRows,
COUNT(DISTINCT employee_key  ) AS DistinctValues, 
sum(case when employee_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when employee_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact       a113
on (a11.employee_key = a113.row_key)
UNION 
select 'opened_by_c1_key '   as Table_Name, 
COUNT(opened_by_c1_key ) AS TotalRows,
COUNT(DISTINCT opened_by_c1_key  ) AS DistinctValues, 
sum(case when opened_by_c1_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when opened_by_c1_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_opened_by_c       a114
on (a11.opened_by_c1_key = a114.row_key)
UNION 
select 'opened_by_key '   as Table_Name, 
COUNT(opened_by_key ) AS TotalRows,
COUNT(DISTINCT opened_by_key  ) AS DistinctValues, 
sum(case when opened_by_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when opened_by_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_caller_c       a115
on (a11.opened_by_key = a115.row_key)
UNION 
select 'fiscal_date_key '   as Table_Name, 
COUNT(fiscal_date_key ) AS TotalRows,
COUNT(DISTINCT fiscal_date_key  ) AS DistinctValues, 
sum(case when fiscal_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when fiscal_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date_fiscal       a116
on (a11.fiscal_date_key = a116.row_key)
UNION 
select 'time_key '   as Table_Name, 
COUNT(time_key ) AS TotalRows,
COUNT(DISTINCT time_key  ) AS DistinctValues, 
sum(case when time_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when time_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_time       a117
on (a11.time_key = a117.row_key)
UNION 
select 'opened_by_c_key '   as Table_Name, 
COUNT(opened_by_c_key ) AS TotalRows,
COUNT(DISTINCT opened_by_c_key  ) AS DistinctValues, 
sum(case when opened_by_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when opened_by_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_employee_type_c       a118
on (a11.opened_by_c_key = a118.row_key)
UNION 
select 'quarter_start_date_key '   as Table_Name, 
COUNT(quarter_start_date_key ) AS TotalRows,
COUNT(DISTINCT quarter_start_date_key  ) AS DistinctValues, 
sum(case when quarter_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when quarter_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date_fiscal       a116
on (a11.fiscal_date_key = a116.row_key)
join ldb.d_calendar_fiscal_quarter       a119
on (a116.quarter_start_date_key = a119.row_key)
UNION 
select 'year_start_date_key '   as Table_Name, 
COUNT(year_start_date_key ) AS TotalRows,
COUNT(DISTINCT year_start_date_key  ) AS DistinctValues, 
sum(case when year_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when year_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date_fiscal       a116
on (a11.fiscal_date_key = a116.row_key)
join ldb.d_calendar_fiscal_year       a120
on (a116.year_start_date_key = a120.row_key)
UNION 
select 'assignment_group_c1_key '   as Table_Name, 
COUNT(assignment_group_c1_key ) AS TotalRows,
COUNT(DISTINCT assignment_group_c1_key  ) AS DistinctValues, 
sum(case when assignment_group_c1_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when assignment_group_c1_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_group_parent_internal_c       a123
on (a11.assignment_group_c1_key = a123.row_key)
UNION 
select 'caller_by_employee_duration_c_key '   as Table_Name, 
COUNT(caller_by_employee_duration_c_key ) AS TotalRows,
COUNT(DISTINCT caller_by_employee_duration_c_key  ) AS DistinctValues, 
sum(case when caller_by_employee_duration_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when caller_by_employee_duration_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_employee_duration_c       a124
on (a11.caller_by_employee_duration_c_key = a124.row_key)
UNION 
select 'company_key '   as Table_Name, 
COUNT(company_key ) AS TotalRows,
COUNT(DISTINCT company_key  ) AS DistinctValues, 
sum(case when company_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when company_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_legalentity       a125
on (a11.company_key = a125.row_key)
UNION 
select 'opened_by_employee_duration_c '   as Table_Name, 
COUNT(opened_by_employee_duration_c ) AS TotalRows,
COUNT(DISTINCT opened_by_employee_duration_c  ) AS DistinctValues, 
sum(case when opened_by_employee_duration_c = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when opened_by_employee_duration_c =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_duration_c       a126
on (a11.opened_by_employee_duration_c = a126.row_key)
UNION 
select 'age_key '   as Table_Name, 
COUNT(age_key ) AS TotalRows,
COUNT(DISTINCT age_key  ) AS DistinctValues, 
sum(case when age_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when age_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident_agebucket       a127
on (a11.age_key = a127.row_key)
UNION 
select 'category_5_c_key '   as Table_Name, 
COUNT(category_5_c_key ) AS TotalRows,
COUNT(DISTINCT category_5_c_key  ) AS DistinctValues, 
sum(case when category_5_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when category_5_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_category_c       a128
on (a11.category_5_c_key = a128.row_key)
UNION 
select 'reported_type_src_key '   as Table_Name, 
COUNT(reported_type_src_key ) AS TotalRows,
COUNT(DISTINCT reported_type_src_key  ) AS DistinctValues, 
sum(case when reported_type_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when reported_type_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident_contacttype       a129
on (a11.reported_type_src_key = a129.row_key)
UNION 
select 'impact_src_key '   as Table_Name, 
COUNT(impact_src_key ) AS TotalRows,
COUNT(DISTINCT impact_src_key  ) AS DistinctValues, 
sum(case when impact_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when impact_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident_impact       a130
on (a11.impact_src_key = a130.row_key)
UNION 
select 'urgency_src_key '   as Table_Name, 
COUNT(urgency_src_key ) AS TotalRows,
COUNT(DISTINCT urgency_src_key  ) AS DistinctValues, 
sum(case when urgency_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when urgency_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident_urgency       a131
on (a11.urgency_src_key = a131.row_key)
UNION 
select 'method_of_contact_c_key '   as Table_Name, 
COUNT(method_of_contact_c_key ) AS TotalRows,
COUNT(DISTINCT method_of_contact_c_key  ) AS DistinctValues, 
sum(case when method_of_contact_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when method_of_contact_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_lov_incident_method_of_contact_c       a132
on (a11.method_of_contact_c_key = a132.row_key)
UNION 
select 'sd_touch_flag_c_key '   as Table_Name, 
COUNT(sd_touch_flag_c_key ) AS TotalRows,
COUNT(DISTINCT sd_touch_flag_c_key  ) AS DistinctValues, 
sum(case when sd_touch_flag_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when sd_touch_flag_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_flag_c       a133
on (a11.sd_touch_flag_c_key = a133.row_key)
UNION 
select 'service_type_c_key '   as Table_Name, 
COUNT(service_type_c_key ) AS TotalRows,
COUNT(DISTINCT service_type_c_key  ) AS DistinctValues, 
sum(case when service_type_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when service_type_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_lov_incident_service_type_c       a134
on (a11.service_type_c_key = a134.row_key)
UNION 
select 'resolver_department_c_key '   as Table_Name, 
COUNT(resolver_department_c_key ) AS TotalRows,
COUNT(DISTINCT resolver_department_c_key  ) AS DistinctValues, 
sum(case when resolver_department_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when resolver_department_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_lov_incident_resolver_department_c       a135
on (a11.resolver_department_c_key = a135.row_key)
UNION 
select 'location_key '   as Table_Name, 
COUNT(location_key ) AS TotalRows,
COUNT(DISTINCT location_key  ) AS DistinctValues, 
sum(case when location_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when location_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_location       a136
on (a11.location_key = a136.row_key)
UNION 
select 'type_c_key '   as Table_Name, 
COUNT(type_c_key ) AS TotalRows,
COUNT(DISTINCT type_c_key  ) AS DistinctValues, 
sum(case when type_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when type_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_lov_incident_type_c       a137
on (a11.type_c_key = a137.row_key)
UNION 
select 'who_is_affected_c_key '   as Table_Name, 
COUNT(who_is_affected_c_key ) AS TotalRows,
COUNT(DISTINCT who_is_affected_c_key  ) AS DistinctValues, 
sum(case when who_is_affected_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when who_is_affected_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_lov_incident_who_is_affected_c       a138
on (a11.who_is_affected_c_key = a138.row_key)
UNION 
select 'application_tier_src_c_key '   as Table_Name, 
COUNT(application_tier_src_c_key ) AS TotalRows,
COUNT(DISTINCT application_tier_src_c_key  ) AS DistinctValues, 
sum(case when application_tier_src_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when application_tier_src_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_configuration_item       a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_lov_configuration_item_application_tier_src_c       a139
on (a12.application_tier_src_c_key = a139.row_key)
UNION 
select 'assigned_to_mdm_key_c '   as Table_Name, 
COUNT(a13.assigned_to_mdm_key_c ) AS TotalRows,
COUNT(DISTINCT a13.assigned_to_mdm_key_c  ) AS DistinctValues, 
sum(case when a13.assigned_to_mdm_key_c = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a13.assigned_to_mdm_key_c =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key = a13.row_key)
join ldb.d_internal_contact_assigned_to_mdm_c       a140
on (a13.assigned_to_mdm_key_c = a140.row_key)
UNION 
select 'portfolio_src_c_key '   as Table_Name, 
COUNT(a14.portfolio_src_c_key ) AS TotalRows,
COUNT(DISTINCT a14.portfolio_src_c_key  ) AS DistinctValues, 
sum(case when a14.portfolio_src_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a14.portfolio_src_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_lov_sys_user_group_portfolio_c       a141
on (a14.portfolio_src_c_key = a141.row_key)
UNION 
select 'criticality_key '   as Table_Name, 
COUNT(criticality_key ) AS TotalRows,
COUNT(DISTINCT criticality_key  ) AS DistinctValues, 
sum(case when criticality_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when criticality_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_business_service       a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_criticality       a142
on (a15.criticality_key = a142.row_key)
UNION 
select 'used_for_src_key '   as Table_Name, 
COUNT(used_for_src_key ) AS TotalRows,
COUNT(DISTINCT used_for_src_key  ) AS DistinctValues, 
sum(case when used_for_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when used_for_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_business_service       a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_used_for       a143
on (a15.used_for_src_key = a143.row_key)
UNION 
select 'close_code_src_key '   as Table_Name, 
COUNT(a19.close_code_src_key ) AS TotalRows,
COUNT(DISTINCT a19.close_code_src_key  ) AS DistinctValues, 
sum(case when a19.close_code_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a19.close_code_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_close_code       a148
on (a19.close_code_src_key = a148.row_key)
UNION 
select 'priority_src_key '   as Table_Name, 
COUNT(a19.priority_src_key ) AS TotalRows,
COUNT(DISTINCT a19.priority_src_key  ) AS DistinctValues, 
sum(case when a19.priority_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a19.priority_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_priority       a150
on (a19.priority_src_key = a150.row_key)
UNION 
select 'met_resolution_sla_flag_key '   as Table_Name, 
COUNT(a19.met_resolution_sla_flag_key ) AS TotalRows,
COUNT(DISTINCT a19.met_resolution_sla_flag_key  ) AS DistinctValues, 
sum(case when a19.met_resolution_sla_flag_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a19.met_resolution_sla_flag_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_task_sla_resolution_flag       a151
on (a19.met_resolution_sla_flag_key = a151.row_key)
UNION 
select 'met_response_sla_flag_key '   as Table_Name, 
COUNT(a19.met_response_sla_flag_key ) AS TotalRows,
COUNT(DISTINCT a19.met_response_sla_flag_key  ) AS DistinctValues, 
sum(case when a19.met_response_sla_flag_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a19.met_response_sla_flag_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_task_sla_response_flag       a152
on (a19.met_response_sla_flag_key = a152.row_key)
UNION 
select 'severity_src_key '   as Table_Name, 
COUNT(a19.severity_src_key ) AS TotalRows,
COUNT(DISTINCT a19.severity_src_key  ) AS DistinctValues, 
sum(case when a19.severity_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a19.severity_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_severity       a153
on (a19.severity_src_key = a153.row_key)
UNION 
select 'state_src_key '   as Table_Name, 
COUNT(a19.state_src_key ) AS TotalRows,
COUNT(DISTINCT a19.state_src_key  ) AS DistinctValues, 
sum(case when a19.state_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a19.state_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_state       a154
on (a19.state_src_key = a154.row_key)
UNION 
select 'sub_category_src_key '   as Table_Name, 
COUNT(a19.sub_category_src_key ) AS TotalRows,
COUNT(DISTINCT a19.sub_category_src_key  ) AS DistinctValues, 
sum(case when a19.sub_category_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a19.sub_category_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_subcategory       a155
on (a19.sub_category_src_key = a155.row_key)
UNION 
select 'customer_mdm_key '   as Table_Name, 
COUNT(customer_mdm_key ) AS TotalRows,
COUNT(DISTINCT customer_mdm_key  ) AS DistinctValues, 
sum(case when customer_mdm_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when customer_mdm_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_customer       a112
on (a11.customer_key = a112.row_key)
join ldb.d_customer_mdm       a144
on (a112.customer_mdm_key = a144.row_key)
UNION 
select 'department_key '   as Table_Name, 
COUNT(department_key ) AS TotalRows,
COUNT(DISTINCT department_key  ) AS DistinctValues, 
sum(case when department_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when department_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact       a113
on (a11.employee_key = a113.row_key)
join ldb.d_internal_organization_department       a145
on (a113.department_key = a145.row_key)
UNION 
select 'employee_mdm_key '   as Table_Name, 
COUNT(employee_mdm_key ) AS TotalRows,
COUNT(DISTINCT employee_mdm_key  ) AS DistinctValues, 
sum(case when employee_mdm_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when employee_mdm_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact       a113
on (a11.employee_key = a113.row_key)
join ldb.d_internal_contact_mdm       a146
on (a113.employee_mdm_key = a146.row_key)
UNION 
select 'hour_key '   as Table_Name, 
COUNT(a117.hour_key ) AS TotalRows,
COUNT(DISTINCT a117.hour_key  ) AS DistinctValues, 
sum(case when a117.hour_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a117.hour_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_time       a117
on (a11.time_key = a117.row_key)
join ldb.d_calendar_time_hour       a147
on (a117.hour_key = a147.row_key)
UNION 
select 'employee_type_c_key '   as Table_Name, 
COUNT(employee_type_c_key ) AS TotalRows,
COUNT(DISTINCT employee_type_c_key  ) AS DistinctValues, 
sum(case when employee_type_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when employee_type_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_employee_type_c       a118
on (a11.opened_by_c_key = a118.row_key)
join ldb.d_lov_sc_req_item_employee_type_c       a149
on (a118.employee_type_c_key = a149.row_key)
UNION 
select 'parent_row_c_key '   as Table_Name, 
COUNT(parent_row_c_key ) AS TotalRows,
COUNT(DISTINCT parent_row_c_key  ) AS DistinctValues, 
sum(case when parent_row_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when parent_row_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords
from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_group_parent_internal_c       a123
on (a11.assignment_group_c1_key = a123.row_key)
join ldb.d_internal_organization_group_parent_c       a156
on (a123.parent_row_c_key = a156.row_key)