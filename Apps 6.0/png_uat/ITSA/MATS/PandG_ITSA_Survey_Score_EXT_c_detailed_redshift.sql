/* Tables Accessed:

d_calendar_date
d_calendar_date_fiscal
d_calendar_fiscal_quarter
d_calendar_fiscal_year
d_calendar_month
d_calendar_quarter
d_custom_flag_c
d_internal_contact_survey_evaluator_c
d_response_ext_c
d_survey_account_ext_c
d_survey_assessor_role_ext_c
d_survey_company_ext_c
d_survey_ebp_type_c
d_survey_ext_c
d_survey_question_ext_c
f_response_ext_c
 */

Select 'f_response_ext_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
UNION 
Select 'd_survey_ext_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_survey_ext_c b ON a.survey_ext_c_key=b.row_key
UNION 
Select 'd_survey_question_ext_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_survey_question_ext_c b ON a.survey_question_ext_c_key=b.row_key
UNION 
Select 'd_survey_company_ext_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_survey_company_ext_c b ON a.survey_company_ext_c_key=b.row_key
UNION 
Select 'd_survey_assessor_role_ext_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_survey_assessor_role_ext_c b ON a.survey_assessor_role_ext_c_key=b.row_key
UNION 
Select 'd_survey_account_ext_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_survey_account_ext_c b ON a.survey_account_ext_c_key=b.row_key
UNION 
Select 'd_internal_contact_survey_evaluator_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_internal_contact_survey_evaluator_c b ON a.survey_evaluator_ext_c_key=b.row_key
UNION 
Select 'd_calendar_date' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_calendar_date b ON a.survey_ext_taken_on_c_key=b.row_key
UNION 
Select 'd_custom_flag_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_custom_flag_c b ON a.score_available_flag_key=b.row_key
UNION 
Select 'd_calendar_date_fiscal' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_calendar_date_fiscal b ON a.survey_ext_taken_on_c_key=b.row_key
UNION 
Select 'd_calendar_fiscal_quarter' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_calendar_date_fiscal b ON a.survey_ext_taken_on_c_key=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key
UNION 
Select 'd_calendar_fiscal_year' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_calendar_date_fiscal b ON a.survey_ext_taken_on_c_key=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
UNION 
Select 'd_response_ext_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_response_ext_c b ON a.response_ext_c_key=b.row_key
UNION 
Select 'd_calendar_month' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_calendar_date b ON a.survey_ext_taken_on_c_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
UNION 
Select 'd_calendar_quarter' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_calendar_date b ON a.survey_ext_taken_on_c_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_calendar_quarter d ON c.quarter_start_date_key=d.row_key
UNION 
Select 'd_survey_ebp_type_c' as Table_name, Count(1) as Row_count
FROM ldb.f_response_ext_c a
JOIN ldb.d_survey_ebp_type_c b ON a.survey_evaluator_ebp_type_c_key=b.row_key


