select 'ldb.f_incident_response	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response	a11 
union
select 'ldb.d_internal_contact	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_internal_contact	a12 
on (a11.sent_to_key = a12.row_key) 
union
select 'ldb.d_calendar_date	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_calendar_date	a13 
on (a11.requested_on_key = a13.row_key) 
union
select 'ldb.d_survey_state	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_survey_state	a14 
on (a11.survey_state_src_key = a14.row_key) 
union
select 'ldb.d_calendar_month	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_response	a11 
join	ldb.d_calendar_date	a13 
on (a11.requested_on_key = a13.row_key) 
left outer join	ldb.d_calendar_month	a15 
on (a13.month_start_date_key = a15.row_key)) 