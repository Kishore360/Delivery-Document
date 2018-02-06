select 'ldb.f_work_order_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_internal_organization_department a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a14 
on (a13.department_key = a14.row_key) 
union
select 'ldb.d_work_order_task a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a15 
on (a11.work_order_task_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a19 
on (a12.month_start_date_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a111 
on (a13.row_current_key = a111.row_current_key) 
union
select 'ldb.d_location a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_location a112 
on (a11.location_key = a112.row_key) 
union
select 'ldb.d_internal_contact_requested_for a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_contact_requested_for a113 
on (a11.requested_for_key = a113.row_key) 
union
select 'ldb.d_work_order_task_impact a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a15 
on (a11.work_order_task_key = a15.row_key) 
join ldb.d_work_order_task_impact a114 
on (a15.work_order_task_impact_key = a114.row_key) 
union
select 'ldb.d_work_order_task_parent_type a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a15 
on (a11.work_order_task_key = a15.row_key) 
join ldb.d_work_order_task_parent_type a115 
on (a15.work_order_task_parent_type_key = a115.row_key) 
union
select 'ldb.d_work_order_task_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a15 
on (a11.work_order_task_key = a15.row_key) 
join ldb.d_work_order_task_priority a116 
on (a15.work_order_task_priority_key = a116.row_key) 
union
select 'ldb.d_work_order_task_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a15 
on (a11.work_order_task_key = a15.row_key) 
join ldb.d_work_order_task_state a117 
on (a15.work_order_task_state_key = a117.row_key) 
union
select 'ldb.d_work_order_task_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a15 
on (a11.work_order_task_key = a15.row_key) 
join ldb.d_work_order_task_type a118 
on (a15.work_order_task_type_key = a118.row_key) 
union
select 'ldb.d_work_order_task_urgency a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a15 
on (a11.work_order_task_key = a15.row_key) 
join ldb.d_work_order_task_urgency a119 
on (a15.work_order_task_urgency_key = a119.row_key) 

