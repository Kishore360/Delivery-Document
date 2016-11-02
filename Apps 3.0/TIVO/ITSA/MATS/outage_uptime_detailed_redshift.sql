select 'ldb.f_outage_uptime_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
union
select 'ldb.d_incident_subcategory a13 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_incident_subcategory a13 
on (a11.sub_category_src_key = a13.row_key) 
union
select 'ldb.d_lov_disposition_code_incident_c a14 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_lov_disposition_code_incident_c a14 
on (a11.disposition_src_c_key = a14.row_key) 
union
select 'ldb.d_lov_feature_type_incident_c a15 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_lov_feature_type_incident_c a15 
on (a11.feature_type_src_c_key = a15.row_key) 
union
select 'ldb.d_incident_category a16 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_incident_category a16 
on (a11.category_src_key = a16.row_key) 
union
select 'ldb.d_incident_state a17 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_incident_state a17 
on (a11.state_src_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_calendar_month a18 
on (a11.month_key = a18.row_key) 
union
select 'ldb.d_lov_issue_type_incident_c a19 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_lov_issue_type_incident_c a19 
on (a11.issue_type_src_c_key = a19.row_key) 
union
select 'ldb.d_task_priority a110 ' as Table_name, count(1) Row_Count
from ldb.f_outage_uptime_c a11 
join ldb.d_task_priority a110 
on (a11.priority_src_key = a110.row_key) 
