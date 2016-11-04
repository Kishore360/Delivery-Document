select 'ldb.f_incident_reassignment_analysis_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_calendar_date a13 
on (a11.created_on_key = a13.row_key) 
union
select 'ldb.d_incident a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_calendar_date_opened a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_calendar_date_opened a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_internal_organization_group a16 
on (a11.old_assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group_reassignment_c a17 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_internal_organization_group_reassignment_c a17 
on (a11.new_assignment_group_key = a17.row_key) 
union
select 'ldb.d_lov_incident_hierarachy_c a18 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_lov_incident_hierarachy_c a18 
on (a11.incident_hierarachy_src_c_key = a18.row_key) 
union
select 'ldb.d_lov_parent_type_c a19 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_lov_parent_type_c a19 
on (a11.parent_type_src_c_key = a19.row_key) 
union
select 'ldb.d_task_priority a110 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_task_priority a110 
on (a11.priority_src_key = a110.row_key) 
union
select 'ldb.d_incident_reported_type a111 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_task_contacttype a111 
on (a11.reported_type_src_key = a111.row_key) 
union
select 'ldb.d_calendar_week a112 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_calendar_date a13 
on (a11.created_on_key = a13.row_key) 
join ldb.d_calendar_week a112 
on (a13.week_start_date_key = a112.row_key) 
union
select 'ldb.d_lov_company_type_core_company_c a113 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
join ldb.d_lov_company_type_core_company_c a113 
on (a12.company_type_src_c_key = a113.row_key) 
union
select 'ldb.d_incident_state a114 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_state a114 
on (a14.state_src_key = a114.row_key) 
union
select 'ldb.d_calendar_month_opened a115 ' as Table_name, count(1) Row_Count
from ldb.f_incident_reassignment_analysis_c a11 
join ldb.d_calendar_date_opened a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month_opened a115 
on (a15.month_start_date_key = a115.row_key) 
