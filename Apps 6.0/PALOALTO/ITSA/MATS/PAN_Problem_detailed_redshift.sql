select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a14 
on (a11.time_key = a14.row_key) 
union
select 'ldb.d_calendar_date_problem_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_problem_c a15 
on (a11.actual_start_c_key = a15.row_key) 
union
select 'ldb.d_problem a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a16 
on (a11.problem_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a19 
on (a11.assignment_group_key = a19.row_key) 
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) 
join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_quarter a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) 
join ldb.d_calendar_quarter a113 
on (a112.quarter_start_date_key = a113.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_opened_by_c a114 
on (a11.opened_by_key = a114.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a115 
on (a13.quarter_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_fiscal_year a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a116 
on (a13.year_start_date_key = a116.row_key) 
union
select 'ldb.d_calendar_week a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) 
join ldb.d_calendar_week a117 
on (a111.week_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_year a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) join ldb.d_calendar_quarter a113 
on (a112.quarter_start_date_key = a113.row_key) 
join ldb.d_calendar_year a118 
on (a113.year_start_date_key = a118.row_key) 
union
select 'ldb.d_change_request a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request a119 
on (a11.change_request_key = a119.row_key) 
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_organization_department a120 
on (a12.department_key = a120.row_key) 
union
select 'ldb.d_internal_contact_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_mdm a121 
on (a12.employee_mdm_key = a121.row_key) 
union
select 'ldb.d_calendar_time_hour a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a14 
on (a11.time_key = a14.row_key) 
join ldb.d_calendar_time_hour a122 
on (a14.hour_key = a122.row_key) 
union
select 'ldb.d_location a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_location a123 
on (a11.location_key = a123.row_key) 
union
select 'ldb.d_problem_reported_type a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a124 
on (a11.reported_type_src_key = a124.row_key) 
union
select 'ldb.d_problem_impact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impact a125 
on (a11.impact_src_key = a125.row_key) 
union
select 'ldb.d_problem_priority a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a126 
on (a11.priority_src_key = a126.row_key) 
union
select 'ldb.d_problem_urgency a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_urgency a127 
on (a11.urgency_src_key = a127.row_key) 
union
select 'ldb.d_lov_configuration_item_application_tier_src_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
join ldb.d_lov_configuration_item_application_tier_src_c a128 
on (a17.application_tier_src_c_key = a128.row_key) 
union
select 'ldb.d_location_assigned_to a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
join ldb.d_location_assigned_to a129 
on (a18.location_key = a129.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a19 
on (a11.assignment_group_key = a19.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a130 
on (a19.portfolio_src_c_key = a130.row_key) 
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_criticality a131 
on (a110.criticality_key = a131.row_key) 
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_used_for a132 
on (a110.used_for_src_key = a132.row_key) 
union
select 'ldb.d_problem_state a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a16 
on (a11.problem_key = a16.row_key) 
join ldb.d_problem_state a133 
on (a16.state_src_key = a133.row_key) 
