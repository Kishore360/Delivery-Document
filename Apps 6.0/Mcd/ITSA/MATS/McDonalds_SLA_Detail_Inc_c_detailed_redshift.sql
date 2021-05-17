select 'ldb.f_incident_task_sla a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_task_sla a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla a15 
on (a11.sla_key = a15.row_key) 
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_scafe_core_realm_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_scafe_core_realm_c a18 
on (a11.scafe_core_realm_c_key = a18.row_key) 
union
select 'ldb.d_task_sla_stage a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla_stage a19 
on (a11.stage_src_key = a19.row_key) 
union
select 'ldb.d_task_sla_name a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla a15 
on (a11.sla_key = a15.row_key) 
join ldb.d_task_sla_name a110 
on (a15.sla_category_key = a110.row_key) 