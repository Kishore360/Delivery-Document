select 'ldb.f_case_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
union
select 'ldb.d_case_task_calendar_date_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_calendar_date_c a12
on (a11.case_task_date_c_key = a12.row_key)
union
select 'ldb.d_case_task_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key)
union
select 'ldb.d_case a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key)
join ldb.d_case a14
on (a13.case_c_key = a14.row_key)
union
select 'ldb.d_case_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key) join ldb.d_case a14
on (a13.case_c_key = a14.row_key)
join ldb.d_case_configuration_item a15
on (a14.configuration_item_key = a15.row_key)
union
select 'ldb.d_ibm_accounts_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key) join ldb.d_case a14
on (a13.case_c_key = a14.row_key)
join ldb.d_ibm_accounts_c a16
on (a14.ibm_accounts_c_key = a16.row_key)
union
select 'ldb.d_case_task_calendar_month_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_calendar_date_c a12
on (a11.case_task_date_c_key = a12.row_key)
join ldb.d_case_task_calendar_month_c a17
on (a12.month_start_date_key = a17.row_key)
union
select 'ldb.d_case_task_calendar_quarter_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_calendar_date_c a12
on (a11.case_task_date_c_key = a12.row_key) join ldb.d_case_task_calendar_month_c a17
on (a12.month_start_date_key = a17.row_key)
join ldb.d_case_task_calendar_quarter_c a18
on (a17.quarter_start_date_key = a18.row_key)
union
select 'ldb.d_case_task_assigned_to_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key)
join ldb.d_case_task_assigned_to_c a19
on (a13.assigned_to_c_key = a19.row_key)
union
select 'ldb.d_case_task_assignment_group_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key)
join ldb.d_case_task_assignment_group_c a110
on (a13.assignment_group_c_key = a110.row_key)
union
select 'ldb.d_case_task_calendar_year_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_calendar_date_c a12
on (a11.case_task_date_c_key = a12.row_key) join ldb.d_case_task_calendar_month_c a17
on (a12.month_start_date_key = a17.row_key) join ldb.d_case_task_calendar_quarter_c a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_case_task_calendar_year_c a111
on (a18.year_start_date_key = a111.row_key)
union
select 'ldb.d_case_task_configuration_item_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key)
join ldb.d_case_task_configuration_item_c a112
on (a13.configuration_item_c_key = a112.row_key)
union
select 'ldb.d_case_task_opened_by_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key)
join ldb.d_case_task_opened_by_c a113
on (a13.opened_by_c_key = a113.row_key)
union
select 'ldb.d_lov_case_task_severity_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key)
join ldb.d_lov_case_task_severity_c a114
on (a13.priority_c_key = a114.row_key)
union
select 'ldb.d_lov_case_task_state_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key)
join ldb.d_lov_case_task_state_c a115
on (a13.state_c_key = a115.row_key)
union
select 'ldb.d_case_assigned_to_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key) join ldb.d_case a14
on (a13.case_c_key = a14.row_key)
join ldb.d_case_assigned_to_c a116
on (a14.assigned_to_c_key = a116.row_key)
union
select 'ldb.d_case_configuration_item_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key) join ldb.d_case a14
on (a13.case_c_key = a14.row_key) join ldb.d_case_configuration_item a15
on (a14.configuration_item_key = a15.row_key)
join ldb.d_case_configuration_item_mdm a117
on (a15.mdm_key = a117.row_key)
union
select 'ldb.d_case_parent_task_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key) join ldb.d_case a14
on (a13.case_c_key = a14.row_key)
join ldb.d_case_parent_task_c a118
on (a14.case_parent_task_c_key = a118.row_key)
union
select 'ldb.d_case_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key) join ldb.d_case a14
on (a13.case_c_key = a14.row_key)
join ldb.d_case_priority a119
on (a14.priority_src_key = a119.row_key)
union
select 'ldb.d_lov_case_status_src_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key) join ldb.d_case a14
on (a13.case_c_key = a14.row_key)
join ldb.d_lov_case_status_src_c a120
on (a14.status_src_c_key = a120.row_key)
union
select 'ldb.d_case_support_tier_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_task_c a11
join ldb.d_case_task_c a13
on (a11.case_task_c_key = a13.row_key) join ldb.d_case a14
on (a13.case_c_key = a14.row_key)
join ldb.d_case_support_tier_c a121
on (a14.case_support_tier_c_key = a121.row_key)