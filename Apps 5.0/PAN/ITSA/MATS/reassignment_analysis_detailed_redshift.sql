select 'ldb.f_incident_reassignment_analysis_c a11 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
union									
select 'ldb.d_incident a12 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
join ldb.d_incident a12 									
on (a11.incident_key = a12.row_key) 									
union									
select 'ldb.d_calendar_date a13 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
join ldb.d_calendar_date a13 									
on (a11.created_on_key = a13.row_key) 									
union									
select 'ldb.d_calendar_date_opened a14 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
join ldb.d_calendar_date_opened a14 									
on (a11.opened_on_key = a14.row_key) 									
union									
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
join ldb.d_internal_organization_group a15 									
on (a11.old_assignment_group_key = a15.row_key) 									
union									
select 'ldb.d_internal_organization_group_reassignment_c a16 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
join ldb.d_internal_organization_group_reassignment_c a16 									
on (a11.new_assignment_group_key = a16.row_key) 									
union									
select 'ldb.d_task_contacttype a17 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
join ldb.d_task_contacttype a17 									
on (a11.reported_type_src_key = a17.row_key) 									
union									
select 'ldb.d_calendar_month_opened a18 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
join ldb.d_calendar_date_opened a14 									
on (a11.opened_on_key = a14.row_key) 									
join ldb.d_calendar_month_opened a18 									
on (a14.month_start_date_key = a18.row_key) 									
union									
select 'ldb.d_internal_organization_group_parent_c a19 ' as Table_name, count(1) Row_Count									
from ldb.f_incident_reassignment_analysis_c a11 									
join ldb.d_internal_organization_group a15 									
on (a11.old_assignment_group_key = a15.row_key) 									
join ldb.d_internal_organization_group_parent_c a19 									
on (a15.parent_row_key_c = a19.row_key) 									
