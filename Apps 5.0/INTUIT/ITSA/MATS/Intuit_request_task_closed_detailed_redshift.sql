select 'ldb.f_request_task_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
union
select 'ldb.d_request_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_item a12 
on (a11.request_item_key = a12.row_key) 
union
select 'ldb.d_task_contacttype_req_item_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_item a12 
on (a11.request_item_key = a12.row_key) 
join ldb.d_task_contacttype_req_item_c a13 
on (a12.ritm_reported_type_src_c_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a17 
on (a16.user_group_classification_level1 = a17.user_group_level1_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a18 
on (a11.closed_on_key = a18.row_key) 
union
select 'ldb.d_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request a19 
on (a11.request_key = a19.row_key) 
union
select 'ldb.d_request_task a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_task a110 
on (a11.request_task_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_organization_group a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a113 
on (a14.row_current_key = a113.row_current_key) 
union
select 'ldb.d_sc_task_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_sc_task_state a114 
on (a11.state_src_key = a114.row_key) 
union
select 'ldb.d_internal_contact_manager_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_internal_contact_manager_c a115 
on (a15.manager_key = a115.row_key) 
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a18 
on (a11.closed_on_key = a18.row_key) 
join ldb.d_calendar_month a116 
on (a18.month_start_date_key = a116.row_key) 
union
select 'ldb.d_calendar_week a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a18 
on (a11.closed_on_key = a18.row_key) 
join ldb.d_calendar_week a117 
on (a18.week_start_date_key = a117.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level2 a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.dh_user_group_classification_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_key) join ldb.dh_user_group_classification_hierarchy_level1 a17 
on (a16.user_group_classification_level1 = a17.user_group_level1_key) 
join ldb.dh_user_group_classification_hierarchy_level2 a118 
on (a17.user_group_level2_key = a118.user_group_level2_key) 
union
select 'ldb.d_calendar_quarter a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a18 
on (a11.closed_on_key = a18.row_key) 
join ldb.d_calendar_quarter a119 
on (a18.quarter_start_date_key = a119.row_key) 
union
select 'ldb.d_calendar_year a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a18 
on (a11.closed_on_key = a18.row_key) 
join ldb.d_calendar_year a120 
on (a18.year_start_date_key = a120.row_key) 