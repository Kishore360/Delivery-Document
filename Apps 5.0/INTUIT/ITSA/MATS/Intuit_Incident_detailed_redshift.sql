select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_incident_infrastructure_category_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_infrastructure_category_c a116 
on (a11.infrastructure_category_src_c_key = a116.row_key) 
union
select 'ldb.d_internal_contact_opened_by_key_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_opened_by_key_c a117 
on (a11.opened_by_c_key = a117.row_key) 
union
select 'ldb.d_incident_sub_type_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_sub_type_c a119 
on (a11.sub_type_c_key = a119.row_key) 
union
select 'ldb.d_incident_symptom_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_symptom_c a120 
on (a11.symptom_src_c_key = a120.row_key) 
union
select 'ldb.d_internal_contact_manager_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_internal_contact_manager_c a126 
on (a14.manager_c_key = a126.row_key) 
union
select 'ldb.d_incident_detected_by_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_detected_by_c a127 
on (a17.detected_by_c_key = a127.row_key) 

