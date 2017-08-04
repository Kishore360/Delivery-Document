select 'ldb.f_call a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_master_item a13 
on (a11.master_item_key = a13.row_key) 
union
select 'ldb.d_call a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_call a14 
on (a11.call_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.dh_employee_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
union
select 'ldb.d_internal_contact_mdm a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a17 
on (a12.row_current_key = a17.row_current_key) 
union
select 'ldb.d_employee_location a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.d_internal_contact_mdm a17 
on (a12.row_current_key = a17.row_current_key) 
join ldb.d_employee_location a18 
on (a17.location_key = a18.row_key) 
union
select 'ldb.d_task a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_task a19 
on (a11.task_key = a19.row_key) 
union
select 'ldb.d_call_reported_type a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_call_reported_type a110 
on (a11.reported_type_src_key = a110.row_key) 
union
select 'ldb.d_call_call_type a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_call_call_type a111 
on (a11.call_type_src_key = a111.row_key) 
union
select 'ldb.d_internal_contact_caller a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact_caller a112 
on (a11.caller_key = a112.row_key) 
union
select 'ldb.d_internal_organization_legalentity a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_organization_legalentity a113 
on (a11.company_key = a113.row_key) 
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_organization_department a114 
on (a11.department_key = a114.row_key) 
union
select 'ldb.d_domain a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_domain a115 
on (a11.domain_key = a115.row_key) 
union
select 'ldb.d_location a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_location a116 
on (a11.location_key = a116.row_key) 
union
select 'ldb.d_calendar_month a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a117 
on (a15.month_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_week a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_week a118 
on (a15.week_start_date_key = a118.row_key) 
union
select 'ldb.dh_employee_level1 a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level1 a119 
on (a16.lev_1_key = a119.row_key) 
union
select 'ldb.d_task_type a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_task a19 
on (a11.task_key = a19.row_key) 
join ldb.d_task_type a120 
on (a19.task_type_src_key = a120.row_key) 
union
select 'ldb.d_calendar_quarter a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_quarter a121 
on (a15.quarter_start_date_key = a121.row_key) 
union
select 'ldb.dh_employee_level2 a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level2 a122 
on (a16.lev_2_key = a122.row_key) 
union
select 'ldb.d_calendar_year a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_year a123 
on (a15.year_start_date_key = a123.row_key) 
union
select 'ldb.dh_employee_level3 a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level3 a124 
on (a16.lev_3_key = a124.row_key) 
union
select 'ldb.dh_employee_level4 a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level4 a125 
on (a16.lev_4_key = a125.row_key) 
union
select 'ldb.dh_employee_level5 a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_call a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level5 a126 
on (a16.lev_5_key = a126.row_key) 
