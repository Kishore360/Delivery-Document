select 'ldb.f_incident_response a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
union
select 'ldb.d_incident_response_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident_response_c a17
on (a11.incident_response_c_key = a17.row_key)
union
select 'ldb.d_calendar_year a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year a18
on (a14.year_start_date_key = a18.row_key)
union
select 'ldb.d_internal_organization_affected_assignment_group_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_organization_affected_assignment_group_c a19
on (a11.survey_affected_assignment_group_c_key = a19.row_key)
union
select 'ldb.d_survey_instance a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_instance a110
on (a11.survey_instance_key = a110.row_key)
union
select 'ldb.d_internal_contact_sent_to_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact_sent_to_c a111
on (a11.sent_to_key = a111.row_key)
union
select 'ldb.d_survey_state a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_state a112
on (a11.state_src_key = a112.row_key)
union
select 'ldb.d_internal_contact_taken_by_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_internal_contact_taken_by_c a113
on (a11.taken_by_key = a113.row_key)
union
select 'ldb.d_survey_wizard_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_survey_wizard_c a114
on (a11.survey_wizard_c_key = a114.row_key)
union
select 'ldb.d_incident_subcategory a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response a11
join ldb.d_incident_subcategory a115
on (a11.incident_sub_category_src_key = a115.row_key)
