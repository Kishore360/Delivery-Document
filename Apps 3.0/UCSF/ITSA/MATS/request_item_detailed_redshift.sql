
select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
union
select 'ldb.d_request_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a18 
on (a12.row_current_key = a18.row_current_key) 
union
select 'ldb.d_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a19 
on (a11.request_key = a19.row_key) 
union
select 'ldb.d_sc_req_item_approval a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a110 
on (a11.approval_state_src_key = a110.row_key) 
union
select 'ldb.d_request_item_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a111 
on (a11.state_src_key = a111.row_key) 
union
select 'ldb.d_internal_contact_requested_for a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a112 
on (a11.requested_for_key = a112.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a113 
on (a11.closed_by_key = a113.row_key) 
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a114 
on (a15.month_start_date_key = a114.row_key) 