select 'ldb.f_work_order_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
union
select 'ldb.d_work_order_task a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a12 
on (a11.work_order_task_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_location a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_location a17 
on (a11.location_key = a17.row_key) 
union
select 'ldb.d_internal_contact_requested_for a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_internal_contact_requested_for a18 
on (a11.requested_for_key = a18.row_key) 
union
select 'ldb.d_work_order_task_impact a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a12 
on (a11.work_order_task_key = a12.row_key) 
join ldb.d_work_order_task_impact a19 
on (a12.work_order_task_impact_key = a19.row_key) 
union
select 'ldb.d_work_order_task_parent_type a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a12 
on (a11.work_order_task_key = a12.row_key) 
join ldb.d_work_order_task_parent_type a110 
on (a12.work_order_task_parent_type_key = a110.row_key) 
union
select 'ldb.d_work_order_task_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a12 
on (a11.work_order_task_key = a12.row_key) 
join ldb.d_work_order_task_priority a111 
on (a12.work_order_task_priority_key = a111.row_key) 
union
select 'ldb.d_work_order_task_state a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a12 
on (a11.work_order_task_key = a12.row_key) 
join ldb.d_work_order_task_state a112 
on (a12.work_order_task_state_key = a112.row_key) 
union
select 'ldb.d_work_order_task_type a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a12 
on (a11.work_order_task_key = a12.row_key) 
join ldb.d_work_order_task_type a113 
on (a12.work_order_task_type_key = a113.row_key) 
union
select 'ldb.d_work_order_task_urgency a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order_task a11 
join ldb.d_work_order_task a12 
on (a11.work_order_task_key = a12.row_key) 
join ldb.d_work_order_task_urgency a114 
on (a12.work_order_task_urgency_key = a114.row_key) 
