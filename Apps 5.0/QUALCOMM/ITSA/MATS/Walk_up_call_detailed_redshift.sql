select 'ldb.f_walk_up_call_c	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_internal_contact	a13 
on (a11.caller_key = a13.row_key) 
union
select 'ldb.d_calendar_time	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_calendar_time	a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_internal_contact_mdm	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_internal_contact	a13 
on (a11.caller_key = a13.row_key) 
join	ldb.d_internal_contact_mdm	a15 
on (a13.row_current_key = a15.row_current_key) 
union
select 'ldb.d_calendar_month	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_month	a16 
on (a12.month_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_quarter	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_quarter	a17 
on (a12.quarter_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_week	a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_week	a18 
on (a12.week_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_year	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_year	a19 
on (a12.year_start_date_key = a19.row_key) 
union
select 'ldb.d_walk_up_call_c	a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_walk_up_call_c	a110 
on (a11.walk_up_call_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_walk_up_call_opened_by_c	a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_walk_up_call_c	a110 
on (a11.walk_up_call_c_key = a110.row_key) 
join	ldb.d_internal_contact_walk_up_call_opened_by_c	a111 
on (a110.opened_by_key = a111.row_key) 
union
select 'ldb.d_internal_contact_assigned_to	a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_internal_contact_assigned_to	a112 
on (a11.assigned_to_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group	a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_internal_organization_group	a113 
on (a11.assignment_group_key = a113.row_key) 
union
select 'ldb.d_internal_organization_legalentity	a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_internal_organization_legalentity	a114 
on (a11.company_key = a114.row_key) 
union
select 'ldb.d_calendar_time_hour	a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_calendar_time	a14 
on (a11.opened_time_key = a14.row_key) 
join	ldb.d_calendar_time_hour	a115 
on (a14.hour_24_format_num = a115.hour_24_format_num) 
union
select 'ldb.d_master_item	a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_master_item	a116 
on (a11.master_item_key = a116.row_key) 
union
select 'ldb.o_data_freshness	a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.o_data_freshness	a117 
on (a12.source_id = a117.source_id) 
union
select 'ldb.d_employee_location	a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_internal_contact	a13 
on (a11.caller_key = a13.row_key) join	ldb.d_internal_contact_mdm	a15 
on (a13.row_current_key = a15.row_current_key) 
join	ldb.d_employee_location	a118 
on (a15.location_key = a118.row_key) 
union
select 'ldb.d_lov_walk_up_call_call_type_c	a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_walk_up_call_c	a110 
on (a11.walk_up_call_c_key = a110.row_key) 
join	ldb.d_lov_walk_up_call_call_type_c	a119 
on (a110.walk_up_call_type_c_key = a119.row_key) 
union
select 'ldb.d_lov_walk_up_call_contact_type_c	a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_walk_up_call_c	a110 
on (a11.walk_up_call_c_key = a110.row_key) 
join	ldb.d_lov_walk_up_call_contact_type_c	a120 
on (a110.walk_up_call_contact_type_c_key = a120.row_key) 
union
select 'ldb.d_internal_contact_walk_up_call_opened_by_manager_c	a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_walk_up_call_c	a11 
join	ldb.d_walk_up_call_c	a110 
on (a11.walk_up_call_c_key = a110.row_key) join	ldb.d_internal_contact_walk_up_call_opened_by_c	a111 
on (a110.opened_by_key = a111.row_key) 
join	ldb.d_internal_contact_walk_up_call_opened_by_manager_c	a121 
on (a111.manager_key = a121.row_key) 