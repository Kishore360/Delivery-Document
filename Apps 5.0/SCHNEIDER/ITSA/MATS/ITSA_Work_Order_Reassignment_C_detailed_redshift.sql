select 'ldb.f_work_order_activity_c' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
union
select'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_internal_organization_group       a12
on (a11.current_assginment_group_key = a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_calendar_date       a13
on (a11.assigned_on_key = a13.row_key)
union
select'ldb.d_work_order' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_work_order       a14
on (a11.work_order_key = a14.row_key)
union
select'ldb.d_internal_contact_to' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_internal_contact_to       a15
on (a11.to_assigned_to_key = a15.row_key)
union
select'ldb.d_internal_organization_group_to' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_internal_organization_group_to       a16
on (a11.to_assignment_group_key = a16.row_key)
union
select'ldb.d_internal_contact_from' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_internal_contact_from       a17
on (a11.from_assigned_to_key = a17.row_key)
union
select'ldb.d_internal_organization_group_from' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_internal_organization_group_from       a18
on (a11.from_assignment_group_key = a18.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_calendar_date       a13
on (a11.assigned_on_key = a13.row_key)
join ldb.d_calendar_month            a19
on (a13.month_start_date_key = a19.row_key)
union
select'ldb.d_work_order_priority' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11 
join ldb.d_work_order       a14
on (a11.work_order_key = a14.row_key)
join ldb.d_work_order_priority       a110
on (a14.work_order_priority_key = a110.row_key)
union
select'ldb.d_work_order_state' as Table_Name, count(1) Row_Count
from  ldb.f_work_order_activity_c       a11
join ldb.d_work_order       a14
on (a11.work_order_key = a14.row_key)
join ldb.d_work_order_state       a111
on (a14.work_order_state_key = a111.row_key)




