select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_change_task a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a15 
on (a11.change_task_key = a15.row_key) 
union
select 'ldb.d_application a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_application a16 
on (a11.application_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
union
select 'ldb.d_change_request_assignment_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request_assignment_group a110 
on (a11.parent_assignment_group_key = a110.row_key) 
union
select 'ldb.d_change_request_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request_priority a111 
on (a11.parent_priority_src_key = a111.row_key) 
union
select 'ldb.d_change_request_phase_state a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_change_request_phase_state a112 
on (a13.phase_state_src_key = a112.row_key) 
union
select 'ldb.d_change_request_phase a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
join ldb.d_change_request_phase a113 
on (a13.phase_src_key = a113.row_key) 
union
select 'ldb.d_change_request_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request_state a114 
on (a11.parent_state_src_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_configuration_item a115 
on (a11.configuration_item_key = a115.row_key) 
union
select 'ldb.d_internal_contact_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a116 
on (a14.row_current_key = a116.row_current_key) 
union
select 'ldb.d_calendar_month a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a117 
on (a12.month_start_date_key = a117.row_key) 
union
select 'ldb.d_change_task_approval a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a15 
on (a11.change_task_key = a15.row_key) 
join ldb.d_change_task_approval a118 
on (a15.approval_src_key = a118.row_key) 
union
select 'ldb.d_change_task_reported_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a15 
on (a11.change_task_key = a15.row_key) 
join ldb.d_change_task_reported_type a119 
on (a15.reported_type_src_key = a119.row_key) 
union
select 'ldb.d_change_task_impact a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a15 
on (a11.change_task_key = a15.row_key) 
join ldb.d_change_task_impact a120 
on (a15.impact_src_key = a120.row_key) 
union
select 'ldb.d_change_task_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a15 
on (a11.change_task_key = a15.row_key) 
join ldb.d_change_task_priority a121 
on (a15.priority_src_key = a121.row_key) 
union
select 'ldb.d_change_task_state a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a15 
on (a11.change_task_key = a15.row_key) 
join ldb.d_change_task_state a122 
on (a15.state_src_key = a122.row_key) 
union
select 'ldb.d_change_task_task_type a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a15 
on (a11.change_task_key = a15.row_key) 
join ldb.d_change_task_task_type a123 
on (a15.task_type_src_key = a123.row_key) 
union
select 'ldb.d_change_task_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a15 
on (a11.change_task_key = a15.row_key) 
join ldb.d_change_task_urgency a124 
on (a15.urgency_src_key = a124.row_key) 
