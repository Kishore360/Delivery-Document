select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.dh_user_group_hierarchy a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_incident_it_business_service_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_it_business_service_c a18 
on (a11.it_business_service_c_key = a18.row_key) 
union
select 'ldb.d_incident_level_1_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_level_1_c a19 
on (a11.level_1_src_c_key = a19.row_key) 
union
select 'ldb.d_incident_level_2_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_level_2_c a110 
on (a11.level_2_src_c_key = a110.row_key) 
union
select 'ldb.d_incident_level_3_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_level_3_c a111 
on (a11.level_3_src_c_key = a111.row_key) 
union
select 'ldb.dh_user_group_level1 a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level1 a112 
on (a14.lev_1_key = a112.row_key) 
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a113 
on (a15.month_start_date_key = a113.row_key) 
union
select 'ldb.d_incident_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_state a114 
on (a16.state_src_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_year a115 
on (a15.year_start_date_key = a115.row_key) 
