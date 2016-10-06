select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.f_request_item_keyword a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.f_request_item_keyword a12 
on (a11.approval_state_src_key = a12.approval_state_src_key and a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and a11.catalog_item_key = a12.catalog_item_key and a11.closed_by_key = a12.closed_by_key and a11.domain_key = a12.domain_key and a11.impact_src_key = a12.impact_src_key and a11.opened_by_key = a12.opened_by_key and a11.opened_on_key = a12.opened_on_key and a11.priority_src_key = a12.priority_src_key and a11.request_item_key = a12.request_item_key and a11.request_key = a12.request_key and a11.requested_for_key = a12.requested_for_key and a11.stage_src_key = a12.stage_src_key and a11.state_src_key = a12.state_src_key and a11.urgency_src_key = a12.urgency_src_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_master_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a14 
on (a11.catalog_item_key = a14.row_key) 
union
select 'ldb.d_request_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a19 
on (a13.row_current_key = a19.row_current_key) 
union
select 'ldb.d_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a110 
on (a11.request_key = a110.row_key) 
union
select 'ldb.d_sc_req_item_approval a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a111 
on (a11.approval_state_src_key = a111.row_key) 
union
select 'ldb.d_request_item_stage a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a112 
on (a11.stage_src_key = a112.row_key) 
union
select 'ldb.d_request_item_state a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a113 
on (a11.state_src_key = a113.row_key) 
union
select 'ldb.d_internal_contact_requested_for a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a114 
on (a11.requested_for_key = a114.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a115 
on (a11.closed_by_key = a115.row_key) 