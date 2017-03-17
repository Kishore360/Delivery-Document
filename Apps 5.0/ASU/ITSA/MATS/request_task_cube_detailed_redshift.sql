select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.dh_user_group_hierarchy a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
union
select 'ldb.d_request_task a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a15 
on (a11.request_task_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
union
select 'ldb.d_request_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_item a17 
on (a11.request_item_key = a17.row_key) 
union
select 'ldb.d_request a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request a18 
on (a11.request_c_key = a18.row_key and a11.request_key = a18.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_assigned_to a19 
on (a11.assigned_to_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_internal_organization_department a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_department a111 
on (a11.opened_by_department_key = a111.row_key) 
union
select 'ldb.d_internal_contact_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a112 
on (a12.row_current_key = a112.row_current_key) 
union
select 'ldb.d_internal_organizaion_requested_for_department_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organizaion_requested_for_department_c a113 
on (a11.requested_for_key = a113.row_key) 
union
select 'ldb.d_sc_task_impact a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_impact a114 
on (a11.impact_src_key = a114.row_key) 
union
select 'ldb.d_sc_task_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_priority a115 
on (a11.priority_src_key = a115.row_key) 
union
select 'ldb.d_request_task_state_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task_state_c a116 
on (a11.state_src_key = a116.row_key) 
union
select 'ldb.d_sc_task_urgency a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_urgency a117 
on (a11.urgency_src_key = a117.row_key) 
union
select 'ldb.d_internal_contact_requested_for a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_requested_for a118 
on (a11.requested_for_key = a118.row_key) 
union
select 'ldb.d_internal_contact_requester_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_requester_c a119 
on (a11.req_task_requester_c_key = a119.row_key) 
union
select 'ldb.d_request_task_stage_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task_stage_c a120 
on (a11.stage_src_key = a120.row_key) 
union
select 'ldb.d_location_variable_building a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_location_variable_building a121 
on (a11.building = a121.row_key) 
union
select 'ldb.d_variable_lov_c_u_request_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_variable_lov_c_u_request_type a122 
on (a11.u_request_type = a122.row_key) 
union
select 'ldb.d_variable_lov_c_v_request_type a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_variable_lov_c_v_request_type a123 
on (a11.v_request_type = a123.row_key) 
union
select 'ldb.dh_user_group_level1 a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level1 a124 
on (a14.lev_1_key = a124.row_key) 
union
select 'ldb.d_calendar_month a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_month a125 
on (a16.month_start_date_key = a125.row_key) 
