select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_problem a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a16 
on (a11.problem_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a17 
on (a11.incident_opened_on_key = a17.row_key) 
union
select 'ldb.d_configuration_item_problem_incident_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item_problem_incident_c a18 
on (a11.incident_configuration_item_key = a18.row_key) 
union
select 'ldb.d_problem_state a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a16 
on (a11.problem_key = a16.row_key) 
join ldb.d_problem_state a19 
on (a16.state_src_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_problem_close_code_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_close_code_c a111 
on (a11.close_code_src_c_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a113 
on (a12.row_current_key = a113.row_current_key) 
union
select 'ldb.d_calendar_fiscal_period a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_period a114 
on (a13.period_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_time_hour a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a115 
on (a14.hour_24_format_num = a115.hour_24_format_num) 
union
select 'ldb.d_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_incident a116 
on (a11.initial_incident_c_key = a116.row_key) 
union
select 'ldb.d_lov_incident_infrastructure_category_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_lov_incident_infrastructure_category_c a117 
on (a11.infrastructure_category_src_c_key = a117.row_key) 
union
select 'ldb.d_problem_reported_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a118 
on (a11.reported_type_src_key = a118.row_key) 
union
select 'ldb.d_task_priority_problem_incident_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_task_priority_problem_incident_c a119 
on (a11.incident_priority_src_key = a119.row_key) 
union
select 'ldb.d_problem_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a120 
on (a11.priority_src_key = a120.row_key) 
union
select 'ldb.d_problem_urgency a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_urgency a121 
on (a11.urgency_src_key = a121.row_key) 
union
select 'ldb.d_problem_sub_type_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_sub_type_c a122 
on (a11.sub_type_src_c_key = a122.row_key) 
union
select 'ldb.d_calendar_month a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a123 
on (a15.month_start_date_key = a123.row_key) 
union
select 'ldb.d_calendar_week a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_week a124 
on (a15.week_start_date_key = a124.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a125 
on (a13.quarter_start_date_key = a125.row_key) 
union
select 'ldb.d_calendar_quarter a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_quarter a126 
on (a15.quarter_start_date_key = a126.row_key) 
union
select 'ldb.d_calendar_fiscal_year a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a127 
on (a13.year_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_year a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_year a128 
on (a15.year_start_date_key = a128.row_key) 