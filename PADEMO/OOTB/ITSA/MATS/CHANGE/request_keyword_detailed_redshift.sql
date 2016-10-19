select 'ldb.f_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
union
select 'ldb.f_request_keyword a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.f_request_keyword a12 
on (a11.approval_state_src_key = a12.approval_state_src_key and a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and a11.configuration_item_key = a12.configuration_item_key and a11.domain_key = a12.domain_key and a11.impact_src_key = a12.impact_src_key and a11.location_key = a12.location_key and a11.opened_by_key = a12.opened_by_key and a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and a11.priority_src_key = a12.priority_src_key and a11.request_key = a12.request_key and a11.urgency_src_key = a12.urgency_src_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a19 
on (a13.row_current_key = a19.row_current_key) 
union
select 'ldb.d_calendar_time_hour a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a110 
on (a14.hour_24_format_num = a110.hour_24_format_num) 
union
select 'ldb.d_request a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_request a111 
on (a11.request_key = a111.row_key) 
union
select 'ldb.d_sc_request_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_sc_request_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_location a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_location a113 
on (a11.location_key = a113.row_key) 