select 'ldb.f_survey_response_keyword_nps_q1_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_survey_response_keyword_nps_q1_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_survey_response_keyword_nps_q1_c a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
union
select 'ldb.d_internal_contact_mdm a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_survey_response_keyword_nps_q1_c a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_mdm a13 
on (a12.employee_mdm_key = a13.row_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_survey_response_keyword_nps_q1_c a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.fiscal_date_key = a14.row_key) 
union
select 'ldb.d_calendar_fiscal_year a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_survey_response_keyword_nps_q1_c a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.fiscal_date_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a15 
on (a14.year_start_date_key = a15.row_key) 