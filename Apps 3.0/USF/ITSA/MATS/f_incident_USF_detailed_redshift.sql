select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.dh_assignment_group_tier_hierarchy a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a15 
on (a11.assignment_group_key = a15.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_type_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_type_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_calendar_greg_fiscal a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a110 
on (a11.opened_on_key = a110.gregorian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a110 
on (a11.opened_on_key = a110.gregorian_calendar_key) 
join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_calendar_key = a111.row_key) 
union
select 'ldb.d_internal_contact_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a112 
on (a13.row_current_key = a112.row_current_key) 
union
select 'ldb.d_enrollment_period_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_enrollment_period_c a113 
on (a11.enrollment_period_key_c = a113.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a114 
on (a11.assigned_to_key = a114.row_key) 
union
select 'ldb.d_internal_organization_group a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a115 
on (a11.assignment_group_key = a115.row_key) 
union
select 'ldb.d_internal_organization_legalentity a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a116 
on (a11.company_key = a116.row_key) 
union
select 'ldb.d_customer_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a117 
on (a12.row_current_key = a117.row_current_key) 
union
select 'ldb.d_internal_organization_department a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a118 
on (a11.opened_by_department_key = a118.row_key) 
union
select 'ldb.d_domain a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a119 
on (a11.domain_key = a119.row_key) 
union
select 'ldb.d_calendar_time_hour a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a120 
on (a14.hour_24_format_num = a120.hour_24_format_num) 
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
select 'ldb.d_incident_category a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_category a126 
on (a17.category_src_key = a126.row_key) 
union
select 'ldb.d_incident_close_code a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_close_code a127 
on (a17.close_code_src_key = a127.row_key) 
union
select 'ldb.d_incident_severity a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_severity a128 
on (a17.severity_src_key = a128.row_key) 
union
select 'ldb.d_incident_state a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_state a129 
on (a17.state_src_key = a129.row_key) 
union
select 'ldb.d_incident_subcategory a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_subcategory a130 
on (a17.sub_category_src_key = a130.row_key) 
union
select 'ldb.d_calendar_fiscal_period a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a110 
on (a11.opened_on_key = a110.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_calendar_key = a111.row_key) 
join ldb.d_calendar_fiscal_period a131 
on (a111.period_start_date_key = a131.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a110 
on (a11.opened_on_key = a110.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_calendar_key = a111.row_key) 
join ldb.d_calendar_fiscal_quarter a132 
on (a111.quarter_start_date_key = a132.row_key) 
union
select 'ldb.d_calendar_year a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_year a133 
on (a18.year_start_date_key = a133.row_key) 
union
select 'ldb.d_calendar_fiscal_year a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_greg_fiscal a110 
on (a11.opened_on_key = a110.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_calendar_key = a111.row_key) 
join ldb.d_calendar_fiscal_year a134 
on (a111.year_start_date_key = a134.row_key) 
