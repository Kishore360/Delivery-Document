select 'ldb.f_walk_up_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
union
select 'ldb.d_walk_up_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_walk_up_c a12 
on (a11.walk_up_c_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_closed_by_c a14 
on (a11.closed_by_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_contact a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact a17 
on (a11.opened_by_key = a17.row_key) 
union
select 'ldb.d_walk_up_priority_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_walk_up_priority_c a18 
on (a11.priority_src_key = a18.row_key) 
union
select 'ldb.d_internal_contact_requestor_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_requestor_c a19 
on (a11.requestor_c_key = a19.row_key) 
union
select 'ldb.d_internal_contact_resolved_by_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_internal_contact_resolved_by_c a110 
on (a11.last_resolved_by_key = a110.row_key) 
union
select 'ldb.d_walk_up_state_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_walk_up_state_c a111 
on (a11.state_src_key = a111.row_key) 
union
select 'ldb.d_walk_up_type_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_c a11 
join ldb.d_walk_up_type_c a112 
on (a11.walkup_type_src_key = a112.row_key) 