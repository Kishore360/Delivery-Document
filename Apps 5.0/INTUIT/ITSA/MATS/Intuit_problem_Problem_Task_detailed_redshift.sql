select 'ldb.f_problem_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
union
select 'ldb.d_calendar_date_fiscal a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_problem a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem a15 
on (a11.problem_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
union
select 'ldb.d_configuration_item_problem_incident_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_configuration_item_problem_incident_c a17 
on (a11.incident_configuration_item_key = a17.row_key) 
union
select 'ldb.d_problem_task a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_task a18 
on (a11.problem_task_key = a18.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_internal_contact_assigned_to a19 
on (a11.assigned_to_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_configuration_item a111 
on (a11.configuration_item_key = a111.row_key) 
union
select 'ldb.d_calendar_fiscal_period a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_fiscal_period a112 
on (a12.period_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_time_hour a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a113 
on (a13.hour_24_format_num = a113.hour_24_format_num) 
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_incident a114 
on (a11.initial_incident_c_key = a114.row_key) 
union
select 'ldb.d_lov_incident_infrastructure_category_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_lov_incident_infrastructure_category_c a115 
on (a11.infrastructure_category_src_c_key = a115.row_key) 
union
select 'ldb.d_internal_organization_problem_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_internal_organization_problem_c a116 
on (a11.problem_assignment_group_key = a116.row_key) 
union
select 'ldb.d_configuration_item_problem_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_configuration_item_problem_c a117 
on (a11.problem_configuration_item_key = a117.row_key) 
union
select 'ldb.d_problem_reported_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_reported_type a118 
on (a11.problem_reported_type_src_key = a118.row_key) 
union
select 'ldb.d_task_priority_problem_incident_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_task_priority_problem_incident_c a119 
on (a11.incident_priority_src_key = a119.row_key) 
union
select 'ldb.d_problem_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_priority a120 
on (a11.problem_priority_src_key = a120.row_key) 
union
select 'ldb.d_problem_task_reported_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_task_reported_type a121 
on (a11.reported_type_src_key = a121.row_key) 
union
select 'ldb.d_problem_task_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_task_priority a122 
on (a11.priority_src_key = a122.row_key) 
union
select 'ldb.d_problem_task_state a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_task_state a123 
on (a11.state_src_key = a123.row_key) 
union
select 'ldb.d_problem_task_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_task_urgency a124 
on (a11.urgency_src_key = a124.row_key) 
union
select 'ldb.d_problem_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_urgency a125 
on (a11.problem_urgency_src_key = a125.row_key) 
union
select 'ldb.d_problem_state a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_problem_state a126 
on (a11.problem_state_src_key = a126.row_key) 
union
select 'ldb.d_calendar_month a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a127 
on (a14.month_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_fiscal_quarter a128 
on (a12.quarter_start_date_key = a128.row_key) 
union
select 'ldb.d_calendar_fiscal_year a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_fiscal_year a129 
on (a12.year_start_date_key = a129.row_key) 