
select 'ldb.f_task_sla_completed_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.dh_user_group_hierarchy a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_calendar_date a14 
on (a11.end_on_key = a14.row_key) 
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_calendar_date a14 
on (a11.end_on_key = a14.row_key) 
join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_task_sla a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_task_sla a16 
on (a11.sla_key = a16.row_key) 
union
select 'ldb.d_task a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_task a17 
on (a11.task_key = a17.row_key) 
union
select 'ldb.d_lov_task_c_state_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_lov_task_c_state_c a18 
on (a11.state_src_key = a18.row_key) 
union
select 'ldb.d_calendar_week a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_calendar_date a14 
on (a11.end_on_key = a14.row_key) 
join ldb.d_calendar_week a19 
on (a14.week_start_date_key = a19.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_contact_assigned_to a110 
on (a11.assigned_to_key = a110.row_key) 
union
select 'ldb.d_internal_organization_legalentity a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_legalentity a111 
on (a11.company_c_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_task_priority a113 
on (a11.priority_key = a113.row_key) 
union
select 'ldb.d_task_contacttype a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_task_contacttype a114 
on (a11.contact_type_c_key = a114.row_key) 
union
select 'ldb.d_lov_task_c_stage_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_lov_task_c_stage_c a115 
on (a11.stage_src_key = a115.row_key) 
union
select 'ldb.dh_user_group_level1 a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level1 a116 
on (a13.lev_1_key = a116.row_key) 
union
select 'ldb.d_internal_contact_assignment_manager_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_assignment_manager_c a117 
on (a12.org_manager_c_key = a117.row_key) 
union
select 'ldb.dh_user_group_level2 a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level2 a118 
on (a13.lev_2_key = a118.row_key) 
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_calendar_date a14 
on (a11.end_on_key = a14.row_key) 
join ldb.d_calendar_month a119 
on (a14.month_start_date_key = a119.row_key) 
union
select 'ldb.dh_user_group_level3 a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level3 a120 
on (a13.lev_3_key = a120.row_key) 
union
select 'ldb.dh_user_group_level4 a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level4 a121 
on (a13.lev_4_key = a121.row_key) 
union
select 'ldb.dh_user_group_level5 a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_completed_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) join ldb.dh_user_group_hierarchy a13 
on (a12.row_dn_key = a13.lev_0_key) 
join ldb.dh_user_group_level5 a122 
on (a13.lev_5_key = a122.row_key) 



