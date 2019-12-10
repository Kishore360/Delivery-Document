select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
  on (a11.incident_key = a12.row_key)
union
select 'ldb.d_application a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
  on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a13
  on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_customer a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a14
  on (a11.customer_key = a14.row_key)
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a15
  on (a11.employee_key = a15.row_key)
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a16
  on (a11.time_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
  on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
  on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
  on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_lov_incident_identifier_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
  on (a11.incident_key = a12.row_key) 
  join ldb.d_application a122
  on (a11.application_key = a122.row_key)
join ldb.d_lov_incident_identifier_c a16
  on (a12.incident_identifier_src_c_key = a16.row_key)
union
select 'ldb.d_affected_services_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
  on (a11.incident_key = a12.row_key) join ldb.d_application a122
  on (a11.application_key = a122.row_key)
join ldb.d_affected_services_c a125
on (a11.affected_services_c_key = a125.row_key)
union
select 'ldb.d_lov_incident_status_new_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
  on (a11.incident_key = a12.row_key) join ldb.d_application a122
  on (a11.application_key = a122.row_key)
join ldb.d_lov_incident_status_new_c a112
  on (a12.incident_status_new_src_c_key = a112.row_key)
union
select 'ldb.d_lov_incident_sub_status_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
  on (a11.incident_key = a12.row_key) join ldb.d_application a122
  on (a11.application_key = a122.row_key)
join ldb.d_lov_incident_sub_status_c a113
  on (a12.incident_sub_status_src_c_key = a113.row_key)
union
select 'ldb.d_lov_incident_atlas_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
  on (a11.incident_key = a12.row_key) join ldb.d_application a122
  on (a11.application_key = a122.row_key)
join ldb.d_lov_incident_atlas_c a115
  on (a12.incident_atlas_src_c_key = a115.row_key)
union
select 'ldb.d_child_incident_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_child_incident_c a124
  on (a11.child_incident_c_key = a124.row_key)
union
select 'ldb.d_kb_number_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_kb_number_c a120
  on (a11.kb_number_c_key = a120.row_key)
union
select 'ldb.d_knowledge_record_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_knowledge_record_c a121
  on (a11.knowledge_record_c_key = a121.row_key)
union
select 'ldb.d_service_request_number_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_service_request_number_c a122
  on (a11.service_request_number_c_key = a122.row_key)