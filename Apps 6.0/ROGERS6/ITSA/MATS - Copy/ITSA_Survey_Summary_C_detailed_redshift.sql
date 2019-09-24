select 'ldb.f_incident_response	a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_calendar_date	a12 
on (a11.requested_on_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group	a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_internal_organization_group	a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_incident	a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_incident	a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_incident_response_c	a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_incident_response_c	a15 
on (a11.incident_response_c_key = a15.row_key) 
union
select 'ldb.d_calendar_year	a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_calendar_date	a12 
on (a11.requested_on_key = a12.row_key) 
join	ldb.d_calendar_year	a16 
on (a12.year_start_date_key = a16.row_key) 
union
select 'ldb.d_internal_organization_affected_assignment_group_c	a17 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_internal_organization_affected_assignment_group_c	a17 
on (a11.survey_affected_assignment_group_c_key = a17.row_key) 
union
select 'ldb.d_survey_instance	a18 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_survey_instance	a18 
on (a11.survey_instance_key = a18.row_key) 
union
select 'ldb.d_internal_contact_sent_to_c	a19 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_internal_contact_sent_to_c	a19 
on (a11.sent_to_key = a19.row_key) 
union
select 'ldb.d_survey_state	a110 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_survey_state	a110 
on (a11.survey_state_src_key = a110.row_key) 
union
select 'ldb.d_internal_contact_taken_by_c	a111 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_internal_contact_taken_by_c	a111 
on (a11.taken_by_key = a111.row_key) 
union
select 'ldb.d_survey_wizard_c	a112 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_survey_wizard_c	a112 
on (a11.survey_wizard_c_key = a112.row_key) 
union
select 'ldb.d_incident_subcategory	a113 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_incident_subcategory	a113 
on (a11.sub_category_src_key = a113.row_key) 