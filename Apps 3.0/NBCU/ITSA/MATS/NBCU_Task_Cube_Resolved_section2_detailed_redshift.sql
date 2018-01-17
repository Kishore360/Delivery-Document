select 'ldb.dh_user_group_level1 a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_resolved_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level1 a116 
on (a14.lev_1_key = a116.row_key) 
union
select 'ldb.dh_user_group_level2 a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_resolved_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level2 a117 
on (a14.lev_2_key = a117.row_key) 
union
select 'ldb.d_calendar_month a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_resolved_closed a11 
join ldb.d_calendar_date a15 
on (a11.last_resolved_on_key = a15.row_key) 
join ldb.d_calendar_month a118 
on (a15.month_start_date_key = a118.row_key) 
union
select 'ldb.dh_user_group_level3 a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_resolved_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level3 a119 
on (a14.lev_3_key = a119.row_key) 
union
select 'ldb.dh_user_group_level4 a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_resolved_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level4 a120 
on (a14.lev_4_key = a120.row_key) 
union
select 'ldb.dh_user_group_level5 a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_resolved_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level5 a121 
on (a14.lev_5_key = a121.row_key) 