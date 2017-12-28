select 'ldb.n_incident_monthly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
union
select 'ldb.d_internal_organization_service_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_service_c a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_internal_organization_technical_service_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_service_c a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_organization_technical_service_c a13 
on (a12.technical_service_c_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_calendar_date a14 
on (a11.n_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_internal_contact_requested_for_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact_requested_for_c a19 
on (a11.requested_for_c_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_technical_service_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_technical_service_c a111 
on (a11.technical_service_c_key = a111.row_key) 
union
select 'ldb.d_business_service a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_business_service a112 
on (a11.business_service_key = a112.row_key) 
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_calendar_date a14 
on (a11.n_key = a14.row_key) 
join ldb.d_calendar_month a113 
on (a14.month_start_date_key = a113.row_key) 
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_department a114 
on (a11.opened_by_department_key = a114.row_key) 
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm a115 
on (a15.row_current_key = a115.row_current_key) 
union
select 'ldb.d_incident_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_incident_category a116 
on (a11.category_src_key = a116.row_key) 
union
select 'ldb.d_internal_organization_group_to a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_group_to a117 
on (a11.task_attribute_wh_new_value_key = a117.row_key) 
union
select 'ldb.d_incident_priority a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_incident_priority a118 
on (a11.priority_src_key = a118.row_key) 
union
select 'ldb.d_incident_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_incident_state a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_internal_organization_resolved_by_group_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_resolved_by_group_c a120 
on (a11.resolved_by_group_key = a120.row_key) 
union
select 'ldb.d_lov_sys_user_country_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact_requested_for_c a19 
on (a11.requested_for_c_key = a19.row_key) 
join ldb.d_lov_sys_user_country_c a121 
on (a19.country_src_c_key = a121.row_key) 
union
select 'ldb.d_internal_organization_department_requested_for_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact_requested_for_c a19 
on (a11.requested_for_c_key = a19.row_key) 
join ldb.d_internal_organization_department_requested_for_c a122 
on (a19.department_key = a122.row_key) 
