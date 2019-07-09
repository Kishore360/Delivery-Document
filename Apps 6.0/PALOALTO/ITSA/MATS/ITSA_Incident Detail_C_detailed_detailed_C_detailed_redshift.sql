select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_internal_contact_mdm a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_mdm a15 
on (a12.employee_mdm_key = a15.row_key) 
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_incident_priority a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_priority a17 
on (a16.priority_src_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_category_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_category_c a19 
on (a11.category_5_c_key = a19.row_key) 
union
select 'ldb.d_incident_contacttype a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a110 
on (a11.reported_type_src_key = a110.row_key) 
union
select 'ldb.d_lov_incident_resolver_department_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_resolver_department_c a111 
on (a11.resolver_department_c_key = a111.row_key) 
union
select 'ldb.d_employee_location a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) join ldb.d_internal_contact_mdm a15 
on (a12.employee_mdm_key = a15.row_key) 
join ldb.d_employee_location a112 
on (a15.location_key = a112.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_task_sla_resolution_flag a113 
on (a16.met_resolution_sla_flag_key = a113.row_key) 
union
select 'ldb.d_task_sla_response_flag a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_task_sla_response_flag a114 
on (a16.met_response_sla_flag_key = a114.row_key) 
union
select 'ldb.d_incident_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_state a115 
on (a16.state_src_key = a115.row_key) 
union
select 'ldb.d_incident_subcategory a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_subcategory a116 
on (a16.sub_category_src_key = a116.row_key) 