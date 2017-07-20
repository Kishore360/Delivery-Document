select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_internal_contact_tech_user_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_tech_user_c a15 
on (a11.tech_user_c_key = a15.row_key) 
union
select 'ldb.d_calendar_time_hour a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a16 
on (a13.hour_24_format_num = a16.hour_24_format_num) 
union
select 'ldb.d_incident_agebucket a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_agebucket a17 
on (a11.age_key = a17.row_key) 
union
select 'ldb.d_lov_incident_agebucket_secondary a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_agebucket_secondary_c a18 
on (a11.secondary_age_c_key = a18.row_key) 
union
select 'ldb.d_location a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a19 
on (a11.location_key = a19.row_key) 
union
select 'ldb.d_incident_priority a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_priority a110 
on (a12.priority_src_key = a110.row_key) 
union
select 'ldb.d_incident_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_state a111 
on (a12.state_src_key = a111.row_key) 
union
select 'ldb.d_lov_resolution_code_incident_outage_view_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_resolution_code_incident_outage_view_c a112 
on (a12.resolution_code_c_key = a112.row_key) 
union
select 'ldb.d_lov_resolution_group_incident_outage_view_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_resolution_group_incident_outage_view_c a113 
on (a12.resolution_group_c_key = a113.row_key) 
union
select 'ldb.d_lov_resolution_source_incident_outage_view_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_resolution_source_incident_outage_view_c a114 
on (a12.resolution_source_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_outage_tech_manager_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_tech_user_c a15 
on (a11.tech_user_c_key = a15.row_key) 
join ldb.d_internal_contact_outage_tech_manager_c a115 
on (a15.employee_manager_c_key = a115.row_key) 
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a116 
on (a14.month_start_date_key = a116.row_key) 
union
select 'ldb.d_calendar_week a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_week a117 
on (a14.week_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_quarter a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_quarter a118 
on (a14.quarter_start_date_key = a118.row_key) 
union
select 'ldb.d_calendar_year a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_year a119 
on (a14.year_start_date_key = a119.row_key) 
