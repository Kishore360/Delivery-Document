select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_quarter       a120
on (a13.quarter_start_date_key = a120.row_key)
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.opened_on_key = a13.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.opened_on_key = a13.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
join ldb.d_calendar_fiscal_quarter a114 
on (a14.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_fiscal_year a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.opened_on_key = a13.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a114 
on (a14.year_start_date_key = a114.row_key)
union
select 'ldb.d_calendar_fiscal_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.opened_on_key = a13.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a115 
on (a14.year_start_date_key = a115.row_key) 
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_customer       a12
on (a11.customer_key = a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a13
on (a11.opened_by_key = a13.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_time       a14
on (a11.opened_time_key = a14.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a15
on (a11.assigned_to_key = a15.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request       a19
on (a11.change_request_key = a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item       a110
on (a11.configuration_item_key = a110.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
union
select'ldb.d_parent_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_parent_incident       a112
on (a111.parent_incident_key = a112.row_key)
union
select'ldb.d_change_request_caused_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request_caused_by       a113
on (a11.caused_by_change_key = a113.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a114
on (a11.company_key = a114.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_customer       a12
on (a11.customer_key = a12.row_key)
join ldb.d_customer_mdm       a115
on (a12.row_current_key = a115.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a116
on (a11.opened_by_department_key = a116.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_domain       a117
on (a11.domain_key = a117.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact       a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm       a118
on (a13.row_current_key = a118.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_time       a14
on (a11.opened_time_key = a14.row_key)
join ldb.d_calendar_time_hour       a119
on (a14.hour_24_format_num = a119.hour_24_format_num)
union
select'ldb.d_incident_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_contacttype       a120
on (a11.reported_type_src_key = a120.row_key)
union
select'ldb.d_incident_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_impact       a121
on (a11.impact_src_key = a121.row_key)
union
select'ldb.d_incident_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_urgency       a122
on (a11.urgency_src_key = a122.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_location       a123
on (a11.location_key = a123.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality       a124
on (a17.criticality_key = a124.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for       a125
on (a17.used_for_src_key = a125.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month       a126
on (a18.month_start_date_key = a126.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_week       a127
on (a18.week_start_date_key = a127.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_quarter       a136
on (a18.quarter_start_date_key = a136.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_year       a137
on (a18.year_start_date_key = a137.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_category       a128
on (a111.category_src_key = a128.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_close_code       a129
on (a111.close_code_src_key = a129.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_priority       a130
on (a111.priority_src_key = a130.row_key)
union
select'ldb.d_task_sla_resolution_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_task_sla_resolution_flag       a131
on (a111.met_resolution_sla_flag_key = a131.row_key)
union
select'ldb.d_task_sla_response_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_task_sla_response_flag       a132
on (a111.met_response_sla_flag_key = a132.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_severity       a133
on (a111.severity_src_key = a133.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_state       a134
on (a111.state_src_key = a134.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_subcategory       a135
on (a111.sub_category_src_key = a135.row_key)






