select 'ldb.f_outage_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_calendar_date a12 
on (a11.outage_start_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_outage_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_outage_c a14 
on (a11.outage_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_configuration_item a15 
on (a11.incident_configuration_item_key = a15.row_key) 
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_incident a16 
on (a11.incident_row_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
left outer join ldb.d_configuration_item a18 
on (a11.business_service_c_key = a18.row_key) 
union
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
left outer join ldb.d_internal_contact_mdm a19 
on (a13.row_current_key = a19.row_current_key) 
union
select 'ldb.d_change_request_outage_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
left outer join ldb.d_change_request_outage_c a110 
on (a11.change_request_key = a110.row_key) 
union
select 'ldb.d_outage_severity_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
left outer join ldb.d_outage_severity_c a111 
on (a11.outage_severity_src_key = a111.row_key) 
union
select 'ldb.d_incident_symptom_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
left outer join ldb.d_incident_symptom_c a112 
on (a11.symptom_src_c_key = a112.row_key) 
union
select 'ldb.d_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
left outer join ldb.d_task_priority a113 
on (a11.priority_src_key = a113.row_key) 
union
select 'ldb.d_incident_close_code a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_incident a16 
on (a11.incident_row_key = a16.row_key) 
left outer join ldb.d_incident_close_code a114 
on (a16.close_code_src_key = a114.row_key) 
union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_outage_c a11 
join ldb.d_calendar_date a12 
on (a11.outage_start_key = a12.row_key) 
left outer join ldb.d_calendar_month a115 
on (a12.month_start_date_key = a115.row_key) 
