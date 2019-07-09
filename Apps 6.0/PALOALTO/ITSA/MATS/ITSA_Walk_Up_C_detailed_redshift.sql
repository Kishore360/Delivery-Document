select 'ldb.f_walk_up_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
union
select 'ldb.d_calendar_date_fiscal a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
join ldb.d_calendar_fiscal_quarter a15 
on (a12.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_fiscal_year a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
join ldb.d_calendar_fiscal_year a16 
on (a12.year_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_month a17 
on (a14.month_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a17 
on (a14.month_start_date_key = a17.row_key) 
join ldb.d_calendar_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_week a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_week a19 
on (a14.week_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a17 
on (a14.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
join ldb.d_calendar_year a110 
on (a18.year_start_date_key = a110.row_key) 
union
select 'ldb.d_internal_contact_requestor_employee_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_requestor_employee_c a111 
on (a11.requestor_c_key = a111.row_key) 
union
select 'ldb.d_walk_up_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_walk_up_c a112 
on (a11.walk_up_c_key = a112.row_key) 
union
select 'ldb.d_internal_contact_walkup_opened_by_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_walkup_opened_by_c a113 
on (a11.opened_by_key = a113.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_assigned_to a114 
on (a11.assigned_to_key = a114.row_key) 
union
select 'ldb.d_employee_duration_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_employee_duration_c a115 
on (a11.requestor_employee_duration_c_key = a115.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_closed_by_c a116 
on (a11.closed_by_key = a116.row_key) 
union
select 'ldb.d_duration_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_duration_c a117 
on (a11.opened_by_employee_duration_c = a117.row_key) 
union
select 'ldb.d_lov_walk_up_priority_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_lov_walk_up_priority_c a118 
on (a11.priority_src_key = a118.row_key) 
union
select 'ldb.d_internal_contact_walkup_requestor_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_walkup_requestor_c a119 
on (a11.requestor_c_key = a119.row_key) 
union
select 'ldb.d_lov_walk_up_state_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_lov_walk_up_state_c a120 
on (a11.state_src_key = a120.row_key) 
union
select 'ldb.d_lov_walk_up_type_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_lov_walk_up_type_c a121 
on (a11.walkup_type_src_key = a121.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a122 
on (a13.portfolio_src_c_key = a122.row_key) 
union
select 'ldb.d_lov_walk_up_employee_type_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_walkup_opened_by_c a113 
on (a11.opened_by_key = a113.row_key) 
join ldb.d_lov_walk_up_employee_type_c a123 
on (a113.employee_type_c_key = a123.row_key) 