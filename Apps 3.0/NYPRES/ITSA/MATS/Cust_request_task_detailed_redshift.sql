select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_calendar_week a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_week a14 
on (a13.week_start_date_key = a14.row_key) 
union
select 'ldb.d_request_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 
union
select 'ldb.d_location_request_item_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 
join ldb.d_location_request_item_c a16 
on (a15.opened_by_location_c_key = a16.row_key) 
union
select 'ldb.d_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request a17 
on (a11.request_key = a17.row_key) 
union
select 'ldb.d_location_request_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request a17 
on (a11.request_key = a17.row_key) 
join ldb.d_location_request_c a18 
on (a17.opened_by_location_c_key = a18.row_key) 
union
select 'ldb.d_request_task a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a19 
on (a11.request_task_key = a19.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_assigned_to a110 
on (a11.assigned_to_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a113 
on (a12.row_current_key = a113.row_current_key) 
union
select 'ldb.d_sc_task_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_state a114 
on (a11.state_src_key = a114.row_key) 
union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a115 
on (a13.month_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_quarter a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_quarter a116 
on (a13.quarter_start_date_key = a116.row_key) 
union
select 'ldb.d_calendar_year a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_year a117 
on (a13.year_start_date_key = a117.row_key) 
