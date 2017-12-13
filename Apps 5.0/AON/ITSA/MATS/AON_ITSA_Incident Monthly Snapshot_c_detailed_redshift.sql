select 'ldb.n_incident_monthly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_calendar_date a12 
on (a11.n_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_internal_contact_requested_for_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact_requested_for_c a16 
on (a11.requested_for_c_key = a16.row_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_calendar_date a12 
on (a11.n_key = a12.row_key) 
join ldb.d_calendar_month a18 
on (a12.month_start_date_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_internal_organization_department a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_department a110 
on (a11.opened_by_department_key = a110.row_key) 
union
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a111 
on (a13.row_current_key = a111.row_current_key) 
union
select 'ldb.d_incident_category a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_incident_category a112 
on (a11.category_src_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_group_to a113 
on (a11.task_attribute_wh_new_value_key = a113.row_key) 
union
select 'ldb.d_incident_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_incident_priority a114 
on (a11.priority_src_key = a114.row_key) 
union
select 'ldb.d_incident_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_incident_state a115 
on (a11.state_src_key = a115.row_key) 
union
select 'ldb.d_internal_organization_resolved_by_group_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_organization_resolved_by_group_c a116 
on (a11.resolved_by_group_key = a116.row_key) 
union
select 'ldb.d_technical_service_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_technical_service_c a117 
on (a11.technical_service_c_key = a117.row_key) 
union
select 'ldb.d_lov_sys_user_country_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact_requested_for_c a16 
on (a11.requested_for_c_key = a16.row_key) 
join ldb.d_lov_sys_user_country_c a118 
on (a16.country_src_c_key = a118.row_key) 
union
select 'ldb.d_internal_organization_department_requested_for_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_monthly_c a11 
join ldb.d_internal_contact_requested_for_c a16 
on (a11.requested_for_c_key = a16.row_key) 
join ldb.d_internal_organization_department_requested_for_c a119 
on (a16.department_key = a119.row_key) 
