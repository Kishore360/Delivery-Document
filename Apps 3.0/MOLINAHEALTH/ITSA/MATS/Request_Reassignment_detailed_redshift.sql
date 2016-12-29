select 'ldb.f_request_item_activity_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_calendar_date a12 
on (a11.assigned_on_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
union
select 'ldb.d_request_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
union
select 'ldb.d_internal_contact_request_item_assigned_to_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_internal_contact_request_item_assigned_to_c a15 
on (a11.current_assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_org_request_item_assignment_group_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_internal_org_request_item_assignment_group_c a16 
on (a11.current_assginment_group_key = a16.row_key) 
union
select 'ldb.d_internal_organization_department a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_internal_organization_department a17 
on (a11.opened_by_department_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_calendar_date a12 
on (a11.assigned_on_key = a12.row_key) 
join ldb.d_calendar_month a18 
on (a12.month_start_date_key = a18.row_key) 
union
select 'ldb.d_internal_contact_request_item_new_assigned_to_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_internal_contact_request_item_new_assigned_to_c a19 
on (a11.new_assigned_to_key = a19.row_key) 
union
select 'ldb.d_internal_org_request_item_new_assignment_group_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_internal_org_request_item_new_assignment_group_c a110 
on (a11.new_assignment_group_key = a110.row_key) 
union
select 'ldb.d_internal_contact_request_item_old_assigned_to_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_internal_contact_request_item_old_assigned_to_c a111 
on (a11.old_assigned_to_key = a111.row_key) 
union
select 'ldb.d_internal_org_request_item_old_assignment_group_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_internal_org_request_item_old_assignment_group_c a112 
on (a11.old_assignment_group_key = a112.row_key) 
union
select 'ldb.d_request_item_state a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_activity_c a11 
join ldb.d_request_item_state a113 
on (a11.current_state_src_key = a113.row_key) 
