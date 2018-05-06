select 'ldb.f_work_order a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
union
select 'ldb.d_work_order a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a12 
on (a11.work_order_key = a12.row_key) 
union
select 'ldb.d_internal_contact_customer_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact_customer_c a13 
on (a11.customer_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_internal_organization_department a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_organization_department a15 
on (a14.department_key = a15.row_key) 
union
select 'ldb.d_work_order_opened_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order_opened_by_c a16 
on (a11.opened_by_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a19 
on (a18.month_start_date_key = a19.row_key) 
union
select 'ldb.d_work_order_customer_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a12 
on (a11.work_order_key = a12.row_key) 
join ldb.d_work_order_customer_c a110 
on (a12.customer_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_person_contact_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a12 
on (a11.work_order_key = a12.row_key) 
join ldb.d_internal_contact_person_contact_c a111 
on (a12.person_c_key = a111.row_key) 
union
select 'ldb.d_work_order_department_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order_opened_by_c a16 
on (a11.opened_by_key = a16.row_key) 
join ldb.d_work_order_department_c a112 
on (a16.department_key = a112.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact_assigned_to a113 
on (a11.assigned_to_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_key = a114.row_key) 
union
select 'ldb.d_internal_contact_master_employee_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact_customer_c a13 
on (a11.customer_key = a13.row_key) 
join ldb.d_internal_contact_master_employee_c a115 
on (a13.bmc_row_key_c = a115.row_key) 
union
select 'ldb.d_internal_contact_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a116 
on (a14.row_current_key = a116.row_current_key) 
union
select 'ldb.d_ksr_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_ksr_c a117 
on (a11.ksr_c_key = a117.row_key) 
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_location a118 
on (a11.location_key = a118.row_key) 
union
select 'ldb.d_work_order_sel_se_reported_source_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a12 
on (a11.work_order_key = a12.row_key) 
join ldb.d_work_order_sel_se_reported_source_c a119 
on (a12.sel_se_reported_source_c_key = a119.row_key) 
union
select 'ldb.d_internal_contact_requested_for a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_internal_contact_requested_for a120 
on (a11.requested_for_key = a120.row_key) 
union
select 'ldb.d_work_order_agebucket_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order_agebucket_c a121 
on (a11.age_key = a121.row_key) 
union
select 'ldb.d_work_order_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a12 
on (a11.work_order_key = a12.row_key) 
join ldb.d_work_order_priority a122 
on (a12.work_order_priority_key = a122.row_key) 
union
select 'ldb.d_work_order_status_reason a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a12 
on (a11.work_order_key = a12.row_key) 
join ldb.d_work_order_status_reason a123 
on (a12.work_order_status_reason_key = a123.row_key) 
union
select 'ldb.d_work_order_state a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_work_order a12 
on (a11.work_order_key = a12.row_key) 
join ldb.d_work_order_state a124 
on (a12.work_order_state_key = a124.row_key) 
union
select 'ldb.d_calendar_quarter a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_quarter a125 
on (a18.quarter_start_date_key = a125.row_key) 
union
select 'ldb.d_calendar_year a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_order a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_year a126 
on (a18.year_start_date_key = a126.row_key) 
