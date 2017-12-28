
select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.dh_user_group_hierarchy a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
union
select 'ldb.d_request_task a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a14 
on (a11.request_task_key = a14.row_key) 
union
select 'ldb.d_sc_task_state a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_state a15 
on (a11.state_src_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_sc_task_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_priority a18 
on (a11.priority_src_key = a18.row_key) 
union
select 'ldb.dh_user_group_level1 a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level1 a19 
on (a13.lev_1_key = a19.row_key) 
union
select 'ldb.dh_user_group_level2 a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level2 a110 
on (a13.lev_2_key = a110.row_key) 
union
select 'ldb.dh_user_group_level3 a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level3 a111 
on (a13.lev_3_key = a111.row_key) 
union
select 'ldb.dh_user_group_level4 a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level4 a112 
on (a13.lev_4_key = a112.row_key) 
union
select 'ldb.dh_user_group_level5 a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level5 a113 
on (a13.lev_5_key = a113.row_key) 
