select 'ldb.f_problem_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_problem_task a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a13
on (a11.problem_task_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_problem_task_assignment_group_support_group_business_unit_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_problem_task_assignment_group_support_group_business_unit_c a16
on (a15.business_unit_c_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a110
on (a17.week_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a111
on (a19.year_start_date_key = a111.row_key)
union
select 'ldb.d_problem a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem a112
on (a11.problem_key = a112.row_key)
union
select 'ldb.d_application_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a113
on (a12.mdm_key = a113.row_key)
union
select 'ldb.d_business_service a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_business_service a114
on (a11.business_service_key = a114.row_key)
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_configuration_item a115
on (a11.configuration_item_key = a115.row_key)
union
select 'ldb.d_lov_fact_source_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_lov_fact_source_c a116
on (a11.fact_source_c_key = a116.row_key)
union
select 'ldb.d_problem_assignment_group a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_assignment_group a117
on (a11.problem_assignment_group_key = a117.row_key)
union
select 'ldb.d_problem_priority a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_priority a118
on (a11.problem_priority_src_key = a118.row_key)
union
select 'ldb.d_problem_task_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task_state a119
on (a11.state_src_key = a119.row_key)
union
select 'ldb.d_lov_problem_task_action_type_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_task a13
on (a11.problem_task_key = a13.row_key) 
join ldb.d_lov_problem_task_action_type_c a120
on (a13.action_type_src_c_key = a120.row_key)
union
select 'ldb.d_internal_contact_vp_svp_pm_action_items_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key) join ldb.d_problem_task_assignment_group_support_group_business_unit_c a16
on (a15.business_unit_c_key = a16.row_key)
join ldb.d_internal_contact_vp_svp_pm_action_items_c a121
on (a16.vp_svp_c_key = a121.row_key)
union
select 'ldb.d_problem_state a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
join ldb.d_problem_state a122
on (a11.problem_state_src_key = a122.row_key)
union
select 'ldb.backlog_flag = '' ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_task a11
