select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_calendar_greg_fiscal a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a18 
on (a11.opened_on_key = a18.gregorian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a18 
on (a11.opened_on_key = a18.gregorian_calendar_key) 
join ldb.d_calendar_date_fiscal a19 
on (a18.fiscal_calendar_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a111 
on (a11.business_service_c_key = a111.row_key) 
union
select 'ldb.d_internal_organization_legalentity a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a112 
on (a11.company_key = a112.row_key) 
union
select 'ldb.d_internal_organization_department a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a113 
on (a11.opened_by_department_key = a113.row_key) 
union
select 'ldb.d_internal_contact_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a114 
on (a12.row_current_key = a114.row_current_key) 
union
select 'ldb.d_calendar_time_hour a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a115 
on (a13.hour_24_format_num = a115.hour_24_format_num) 
union
select 'ldb.d_incident_infrastructure_category_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_infrastructure_category_c a116 
on (a11.infrastructure_category_src_c_key = a116.row_key) 
union
select 'ldb.d_internal_contact_opened_by_key_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_opened_by_key_c a117 
on (a11.opened_by_c_key = a117.row_key) 
union
select 'ldb.d_problem a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_problem a118 
on (a11.problem_key = a118.row_key) 
union
select 'ldb.d_incident_sub_type_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_sub_type_c a119 
on (a11.sub_type_c_key = a119.row_key) 
union
select 'ldb.d_incident_symptom_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_symptom_c a120 
on (a11.symptom_src_c_key = a120.row_key) 
union
select 'ldb.d_task_impact a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a121 
on (a11.impact_src_key = a121.row_key) 
union
select 'ldb.d_location a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a122 
on (a11.location_key = a122.row_key) 
union
select 'ldb.d_task_priority a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a123 
on (a11.priority_src_key = a123.row_key) 
union
select 'ldb.d_task_contacttype a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a124 
on (a11.reported_type_src_key = a124.row_key) 
union
select 'ldb.d_task_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a125 
on (a11.urgency_src_key = a125.row_key) 
union
select 'ldb.d_internal_contact_manager_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_internal_contact_manager_c a126 
on (a14.manager_c_key = a126.row_key) 
union
select 'ldb.d_incident_detected_by_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_detected_by_c a127 
on (a17.detected_by_c_key = a127.row_key) 
union
select 'ldb.d_calendar_fiscal_period a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a18 
on (a11.opened_on_key = a18.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a19 
on (a18.fiscal_calendar_key = a19.row_key) 
join ldb.d_calendar_fiscal_period a128 
on (a19.period_start_date_key = a128.row_key) 
union
select 'ldb.d_incident_category a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_category a129 
on (a17.category_src_key = a129.row_key) 
union
select 'ldb.d_incident_close_code a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_close_code a130 
on (a17.close_code_src_key = a130.row_key) 
union
select 'ldb.d_incident_severity a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_severity a131 
on (a17.severity_src_key = a131.row_key) 
union
select 'ldb.d_incident_state a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_state a132 
on (a17.state_src_key = a132.row_key) 
union
select 'ldb.d_calendar_month a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_month a133 
on (a16.month_start_date_key = a133.row_key) 
union
select 'ldb.d_calendar_week a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_week a134 
on (a16.week_start_date_key = a134.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a18 
on (a11.opened_on_key = a18.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a19 
on (a18.fiscal_calendar_key = a19.row_key) 
join ldb.d_calendar_fiscal_quarter a135 
on (a19.quarter_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_quarter a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_quarter a136 
on (a16.quarter_start_date_key = a136.row_key) 
union
select 'ldb.d_calendar_fiscal_year a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a18 
on (a11.opened_on_key = a18.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a19 
on (a18.fiscal_calendar_key = a19.row_key) 
join ldb.d_calendar_fiscal_year a137 
on (a19.year_start_date_key = a137.row_key) 
union
select 'ldb.d_calendar_year a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_year a138 
on (a16.year_start_date_key = a138.row_key) 
