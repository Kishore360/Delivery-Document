select 'ldb.f_service_request_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_service_request_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a13 
on (a11.service_request_c_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_closed_by_c a17 
on (a11.closed_by_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_internal_organization_department a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_organization_department a19 
on (a11.department_key = a19.row_key) 
union
select 'ldb.d_internal_contact_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a110 
on (a12.row_current_key = a110.row_current_key) 
union
select 'ldb.d_internal_contact_requestor_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact_requestor_c a111 
on (a11.requestor_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_internal_contact a112 
on (a11.last_resolved_by_key = a112.row_key) 
union
select 'ldb.d_lov_service_request_category_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a13 
on (a11.service_request_c_key = a13.row_key) 
join ldb.d_lov_service_request_category_c a113 
on (a13.category_src_key = a113.row_key) 
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a114 
on (a14.month_start_date_key = a114.row_key) 
union
select 'ldb.d_lov_service_request_priority_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a13 
on (a11.service_request_c_key = a13.row_key) 
join ldb.d_lov_service_request_priority_c a115 
on (a13.priority_src_key = a115.row_key) 
union
select 'ldb.d_lov_service_request_state_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a13 
on (a11.service_request_c_key = a13.row_key) 
join ldb.d_lov_service_request_state_c a116 
on (a13.state_src_key = a116.row_key) 
union
select 'ldb.d_lov_service_request_subcategory_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a13 
on (a11.service_request_c_key = a13.row_key) 
join ldb.d_lov_service_request_subcategory_c a117 
on (a13.subcategory_src_key = a117.row_key) 
union
select 'ldb.d_lov_service_request_type_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c a11 
join ldb.d_service_request_c a13 
on (a11.service_request_c_key = a13.row_key) 
join ldb.d_lov_service_request_type_c a118 
on (a13.type_src_key = a118.row_key) 