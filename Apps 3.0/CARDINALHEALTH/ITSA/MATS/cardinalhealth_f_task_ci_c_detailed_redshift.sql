select 'ldb.f_task_ci_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_date a12 
on (a11.created_on_c_key = a12.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.created_on_c_key = a13.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.created_on_c_key = a13.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a15 
on (a11.assignment_group_key = a15.level0_assigment_group_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_c_key = a16.row_key) 
union
select 'ldb.d_change_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_change_request a17 
on (a11.change_request_c_key = a17.row_key) 
union
select 'ldb.d_task a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_task a18 
on (a11.task_c_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_internal_organization_group a19 
on (a11.assignment_group_key = a19.row_key) 
union
select 'ldb.d_configuration_item_change_rel_cmdb_ci_configuration_item_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item_change_rel_cmdb_ci_configuration_item_c a110 
on (a11.configuration_item_c_key = a110.row_key) 
union
select 'ldb.d_change_request_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_change_request_state a111 
on (a11.state_src_key = a111.row_key) 
union
select 'ldb.d_calendar_fiscal_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.created_on_c_key = a13.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a112 
on (a14.year_start_date_key = a112.row_key) 
union
select 'ldb.d_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_incident a113 
on (a11.incident_c_key = a113.row_key) 
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_date a12 
on (a11.created_on_c_key = a12.row_key) 
join ldb.d_calendar_month a114 
on (a12.month_start_date_key = a114.row_key) 
union
select 'ldb.d_change_request_lov_stage_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_change_request_lov_stage_c a115 
on (a11.stage_src_c_key = a115.row_key) 
union
select 'ldb.d_change_request_lov_success_state_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_change_request_lov_success_state_c a116 
on (a11.success_status_c_key = a116.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a15 
on (a11.assignment_group_key = a15.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a117 
on (a15.level0_manager_c_key = a117.level0_manager_c_key) 
union
select 'ldb.d_internal_contact_configuration_item_cat_representative_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_c_key = a16.row_key) 
join ldb.d_internal_contact_configuration_item_cat_representative_c a118 
on (a16.cat_representative_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_ci_director_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_c_key = a16.row_key) 
join ldb.d_internal_contact_ci_director_c a119 
on (a16.director_c_key = a119.row_key) 
union
select 'ldb.d_internal_contact_ci_manager_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_c_key = a16.row_key) 
join ldb.d_internal_contact_ci_manager_c a120 
on (a16.manager_c_key = a120.row_key) 
union
select 'ldb.d_internal_contact_ci_vp_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_c_key = a16.row_key) 
join ldb.d_internal_contact_ci_vp_c a121 
on (a16.vp_c_key = a121.row_key) 
union
select 'ldb.d_internal_contact_level_5_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_c_key = a16.row_key) 
join ldb.d_internal_contact_level_5_c a122 
on (a16.cah_level_5_c_key = a122.row_key) 