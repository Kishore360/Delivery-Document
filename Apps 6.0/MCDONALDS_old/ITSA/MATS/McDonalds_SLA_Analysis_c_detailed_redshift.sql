select 'ldb.f_sla_analysis_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_analysis_c a11 
union
select 'ldb.d_sla_analysis_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_analysis_c a11 
join ldb.d_sla_analysis_c a12 
on (a11.sla_analysis_c_key = a12.row_key) 
union
select 'ldb.d_business_service a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_analysis_c a11 
join ldb.d_business_service a13 
on (a11.business_service_key = a13.row_key) 
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_analysis_c a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_lov_sla_priority_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_analysis_c a11 
join ldb.d_lov_sla_priority_c a15 
on (a11.priority_src_key = a15.row_key) 
union
select 'ldb.d_scafe_core_realm_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_analysis_c a11 
join ldb.d_scafe_core_realm_c a16 
on (a11.scafe_core_realm_c_key = a16.row_key) 
union
select 'ldb.d_lov_sla_state_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_analysis_c a11 
join ldb.d_lov_sla_state_c a17 
on (a11.state_src_key = a17.row_key) 