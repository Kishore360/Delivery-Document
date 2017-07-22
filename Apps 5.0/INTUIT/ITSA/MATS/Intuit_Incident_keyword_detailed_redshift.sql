select 'ldb.f_incident_keyword a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_incident a13 
on (a11.table_row_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_customer a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_customer a15 
on (a11.customer_key = a15.row_key) 
union
select 'ldb.d_internal_contact a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact a16 
on (a11.opened_by_key = a16.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a18 
on (a17.user_group_classification_level1 = a18.user_group_level1_key) 
union
select 'ldb.dh_assignment_group_tier_hierarchy a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.dh_assignment_group_tier_hierarchy a19 
on (a11.assignment_group_key = a19.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.dh_assignment_group_type_hierarchy a110 
on (a11.assignment_group_key = a110.user_group_type_key) 
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
union
select 'ldb.d_internal_contact_manager_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_internal_contact_manager_c a112 
on (a14.manager_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_organization_group a113 
on (a11.assignment_group_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_configuration_item a114 
on (a11.business_service_c_key = a114.row_key) 
union
select 'ldb.d_customer_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_customer a15 
on (a11.customer_key = a15.row_key) 
join ldb.d_customer_mdm a115 
on (a15.row_current_key = a115.row_current_key) 
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact a16 
on (a11.opened_by_key = a16.row_key) 
join ldb.d_internal_organization_department a116 
on (a16.department_key = a116.row_key) 
union
select 'ldb.d_incident_contacttype a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_incident_contacttype a117 
on (a11.reported_type_src_key = a117.row_key) 
union
select 'ldb.d_calendar_month a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_month a118 
on (a111.month_start_date_key = a118.row_key) 
union
select 'ldb.d_calendar_week a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_week a119 
on (a111.week_start_date_key = a119.row_key) 
union
select 'ldb.d_incident_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_incident_priority a120 
on (a11.priority_src_key = a120.row_key) 
union
select 'ldb.d_calendar_quarter a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_quarter a121 
on (a111.quarter_start_date_key = a121.row_key) 
union
select 'ldb.d_calendar_year a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_year a122 
on (a111.year_start_date_key = a122.row_key) 