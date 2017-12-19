select 'ldb.f_walk_up_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
union
select 'ldb.d_walk_up_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_walk_up_c a12 
on (a11.walk_up_c_key = a12.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join          ldb.d_calendar_date_fiscal    a15
                  on          (a11.opened_on_key = a15.row_key)

union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_closed_by_c a17 
on (a11.closed_by_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_contact a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact a19 
on (a11.opened_by_key = a19.row_key) 
union
select 'ldb.d_lov_walk_up_priority_c  a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_lov_walk_up_priority_c  a110 
on (a11.priority_src_key = a110.row_key) 
union
select 'ldb.d_internal_contact_requestor_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_requestor_c a111 
on (a11.requestor_c_key = a111.row_key) 
union
select 'ldb.d_lov_walk_up_state_c  a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_lov_walk_up_state_c  a112 
on (a11.state_src_key = a112.row_key) 
union
select 'ldb.d_lov_walk_up_type_c  a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_lov_walk_up_type_c  a113 
on (a11.walkup_type_src_key = a113.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join          ldb.d_calendar_date_fiscal    a15
                  on          (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_fiscal_quarter a114 
on (a15.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_fiscal_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join          ldb.d_calendar_date_fiscal    a15
                  on          (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_fiscal_year a115 
on (a15.year_start_date_key = a115.row_key) 

union
select 'ldb.d_internal_contact_opened_by_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_opened_by_c a117 
on (a11.opened_by_key = a117.row_key) 
union
select 'ldb.d_lov_request_item_employee_type_c a1117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact a19 
on (a11.opened_by_key = a19.row_key) 
join ldb.d_lov_request_item_employee_type_c a1117 
on (a19.employee_type_c_key = a1117.row_key) 
union
select 'ldb.d_walkup_type_c a1117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact a19 
on (a11.opened_by_key = a19.row_key) 
join ldb.d_walk_up_type_c a118 
on a118.row_key=a19.employee_type_c_key


