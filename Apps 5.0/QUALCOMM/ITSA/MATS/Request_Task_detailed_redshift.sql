select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_request_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a16 
on (a11.request_task_key = a16.row_key) 
union
select 'ldb.d_internal_contact_mdm a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a17 
on (a12.row_current_key = a17.row_current_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a18 
on (a15.month_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_quarter a19 
on (a15.quarter_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_week a110 
on (a15.week_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_year a111 
on (a15.year_start_date_key = a111.row_key) 
union
select 'ldb.d_request_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_item a112 
on (a11.request_item_key = a112.row_key) 
union
select 'ldb.d_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request a113 
on (a11.request_key = a113.row_key) 
union
select 'ldb.d_internal_contact_request_task_closed_by_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a16 
on (a11.request_task_key = a16.row_key) 
join ldb.d_internal_contact_request_task_closed_by_c a114 
on (a16.closed_by_key = a114.row_key) 
union
select 'ldb.d_internal_contact_request_task_opened_by_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a16 
on (a11.request_task_key = a16.row_key) 
join ldb.d_internal_contact_request_task_opened_by_c a115 
on (a16.opened_by_key = a115.row_key) 
union
select 'ldb.d_internal_contact_request_task_opened_by_manager_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a16 
on (a11.request_task_key = a16.row_key) join ldb.d_internal_contact_request_task_opened_by_c a115 
on (a16.opened_by_key = a115.row_key) 
join ldb.d_internal_contact_request_task_opened_by_manager_c a116 
on (a115.manager_key = a116.row_key) 
union
select 'ldb.d_configuration_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_configuration_item a117 
on (a11.configuration_item_key = a117.row_key) 
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_location a118 
on (a11.location_key = a118.row_key) 
union
select 'ldb.d_sc_task_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_priority a119 
on (a11.priority_src_key = a119.row_key) 
union
select 'ldb.d_sc_task_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_state a120 
on (a11.state_src_key = a120.row_key) 
union
select 'ldb.o_data_freshness a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.o_data_freshness a121 
on (a15.source_id = a121.source_id) 


