select 'ldb.f_incident_response	a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
union
select 'ldb.d_internal_contact	a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_internal_contact	a12 
on (a11.sent_to_key = a12.row_key) 
union
select 'ldb.d_calendar_date	a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_calendar_date	a13 
on (a11.requested_on_key = a13.row_key) 
union
select 'ldb.d_calendar_year	a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_calendar_date	a13 
on (a11.requested_on_key = a13.row_key) 
left outer join	ldb.d_calendar_year	a14 
on (a13.year_start_date_key = a14.row_key) 
union
select 'ldb.d_survey_state	a144 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_survey_state	a144 
on (a11.survey_state_src_key = a144.row_key) 
union
select 'ldb.d_incident_response_c	a122 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_incident_response_c	a122 
on (a11.incident_response_c_key= a122.row_key) 
union
select 'ldb.d_survey_wizard_c	a123 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_survey_wizard_c	a123 
on (a11.survey_wizard_c_key = a123.row_key) 
union
select 'ldb.d_survey_question	a124 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_survey_question	a124 
on (a11.assigned_to_key = a124.row_key) 
union
select 'ldb.d_question_type	a134 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_survey_question	a124 
on (a11.assigned_to_key = a124.row_key) 
left outer join	ldb.d_question_type	a134 
on (a124.question_type_src_key = a134.row_key) 