select 'ldb.f_work_order a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_internal_organization_department a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_organization_department a13 
on (a12.department_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_work_order a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a15 
on (a11.work_order_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a16 
on (a14.month_start_date_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_internal_contact_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a110 
on (a12.row_current_key = a110.row_current_key) 
union
select 'ldb.d_ksr_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_ksr_c a111 
on (a11.ksr_c_key = a111.row_key) 
union
select 'ldb.d_location a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_location a112 
on (a11.location_key = a112.row_key) 
union
select 'ldb.d_internal_contact_requested_for a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact_requested_for a113 
on (a11.requested_for_key = a113.row_key) 
union
select 'ldb.d_work_order_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a15 
on (a11.work_order_key = a15.row_key) 
join ldb.d_work_order_priority a114 
on (a15.work_order_priority_key = a114.row_key) 
union
select 'ldb.d_work_order_status_reason a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a15 
on (a11.work_order_key = a15.row_key) 
join ldb.d_work_order_status_reason a115 
on (a15.work_order_status_reason_key = a115.row_key) 
union
select 'ldb.d_work_order_state a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a15 
on (a11.work_order_key = a15.row_key) 
join ldb.d_work_order_state a116 
on (a15.work_order_state_key = a116.row_key) 
union
select 'ldb.d_calendar_quarter a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_quarter a117 
on (a14.quarter_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_year a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_year a118 
on (a14.year_start_date_key = a118.row_key) 
