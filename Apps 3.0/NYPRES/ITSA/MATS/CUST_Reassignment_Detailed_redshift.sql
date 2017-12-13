select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.d_internal_contact_customer_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_customer_c a12 
on (a11.customer_c_key = a12.row_key) 
union
select 'ldb.d_incident_customer_location_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_customer_c a12 
on (a11.customer_c_key = a12.row_key) 
join ldb.d_incident_customer_location_c a13 
on (a12.location_key = a13.row_key) 
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_opened_by_c a15 
on (a11.current_opened_by_key = a15.row_key) 
union
select 'ldb.d_location_opened_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_opened_by_c a15 
on (a11.current_opened_by_key = a15.row_key) 
join ldb.d_location_opened_by_c a16 
on (a15.location_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a17 
on (a11.assigned_on_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group a18 
on (a11.current_assginment_group_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_internal_contact_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_to a110 
on (a11.to_assigned_to_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_to a111 
on (a11.to_assignment_group_key = a111.row_key) 
union
select 'ldb.d_internal_contact_from a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_from a112 
on (a11.from_assigned_to_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group_from a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_from a113 
on (a11.from_assignment_group_key = a113.row_key) 
union
select 'ldb.d_internal_contact a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact a114 
on (a11.last_resolved_by_key = a114.row_key) 
union
select 'ldb.d_task_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_task_priority a115 
on (a11.priority_src_key = a115.row_key) 
union
select 'ldb.d_incident_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_category a116 
on (a14.category_src_key = a116.row_key) 
union
select 'ldb.d_incident_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_state a117 
on (a14.state_src_key = a117.row_key) 
union
select 'ldb.d_incident_subcategory a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_subcategory a118 
on (a14.sub_category_src_key = a118.row_key) 
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a17 
on (a11.assigned_on_key = a17.row_key) 
join ldb.d_calendar_month a119 
on (a17.month_start_date_key = a119.row_key) 
