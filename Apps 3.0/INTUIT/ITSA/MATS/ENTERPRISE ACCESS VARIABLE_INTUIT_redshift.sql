SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_configuration_item a14 
on (a11.configuration_item_key = a14.row_key) 
union
select 'ldb.d_request_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_access_application_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_access_application_c a18 
on (a11.application_c_key = a18.row_key) 
union
select 'ldb.d_configuration_application_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_configuration_application_c a19 
on (a11.cmdb_ci_c_key = a19.row_key) 
union
select 'ldb.d_variable_lov_c_access_action a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_variable_lov_c_access_action a110 
on (a11.access_action_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a111 
on (a11.assigned_to_key = a111.row_key) 
union
select 'ldb.d_internal_contact_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a112 
on (a12.row_current_key = a112.row_current_key) 
union
select 'ldb.d_access_environments_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_access_environments_c a113 
on (a11.environment_c_key = a113.row_key) 
union
select 'ldb.d_request a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a114 
on (a11.request_key = a114.row_key) 
union
select 'ldb.d_sc_req_item_approval a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a115 
on (a11.approval_state_src_key = a115.row_key) 
union
select 'ldb.d_request_item_stage a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a116 
on (a11.stage_src_key = a116.row_key) 
union
select 'ldb.d_request_item_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a117 
on (a11.state_src_key = a117.row_key) 
union
select 'ldb.d_internal_organization_group_request_task_assignment_group_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group_request_task_assignment_group_c a118 
on (a11.request_task_assignment_group_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_requested_for a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a119 
on (a11.requested_for_key = a119.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a120 
on (a11.closed_by_key = a120.row_key) 
union
select 'ldb.d_calendar_month a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_month a121 
on (a17.month_start_date_key = a121.row_key) 
union
select 'ldb.d_internal_organization_group_request_item_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_configuration_application_c a19 
on (a11.cmdb_ci_c_key = a19.row_key) 
join ldb.d_internal_organization_group_request_item_c a122 
on (a19.support_group_key = a122.row_key) 
union
select 'ldb.d_calendar_week a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_week a123 
on (a17.week_start_date_key = a123.row_key) 

)a
)b