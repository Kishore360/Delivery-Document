select'f_incident_response' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key)
join ldb.d_calendar_month a13 on (a12.month_start_date_key = a13.row_key)
UNION
select'd_calendar_week' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response  a11 
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key)
join ldb.d_calendar_week a13 on (a12.week_start_date_key = a13.row_key)
union
select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response  a11 
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key)
join ldb.d_calendar_year a13 on (a12.year_start_date_key = a13.row_key)
union
select'd_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response  a11 
join ldb.d_calendar_date a12 on (a11.requested_on_key = a12.row_key)
join ldb.d_calendar_quarter a13 on (a12.quarter_start_date_key = a13.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_incident a14 on (a11.incident_key = a14.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_internal_contact a15 on (a11.sent_to_key = a15.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_internal_contact  a15 on (a11.sent_to_key = a15.row_key)
join ldb.d_internal_contact_mdm  a16 on (a15.row_current_key = a16.row_current_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_internal_organization_department a17 on (a11.taken_by_department_key = a17.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_internal_organization_group a18 on (a11.assignment_group_key = a18.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_location a19 on (a11.location_key = a19.row_key)
union
select'd_survey_question' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response  a11 
join ldb.d_survey_question  a110 on (a11.question_key = a110.row_key)
union
select'd_question_type' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response  a11 
join ldb.d_survey_question a110 on (a11.question_key = a110.row_key)
join ldb.d_question_type a111 on (a110.question_type_src_key = a111.row_key)
union
select'd_survey' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response a11 
join ldb.d_survey a112 on (a11.survey_key = a112.row_key)
union
select'd_survey_instance' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_response  a11 
join ldb.d_survey_instance a112 on (a11.survey_instance_key = a112.row_key)
UNION 
SELECT 'd_calendar_greg_fiscal' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_response a 
JOIN ldb.d_calendar_greg_fiscal b ON a.requested_on_key=b.gregorian_calendar_key
UNION 
SELECT 'd_calendar_fiscal_quarter' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_response a 
JOIN ldb.d_calendar_greg_fiscal b ON a.requested_on_key=b.gregorian_calendar_key
JOIN ldb.d_calendar_date_fiscal c ON b.fiscal_calendar_key=c.row_key
JOIN ldb.d_calendar_fiscal_quarter d ON c.quarter_start_date_key=d.row_key
UNION 
SELECT 'd_calendar_fiscal_period' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_response a 
JOIN ldb.d_calendar_greg_fiscal b ON a.requested_on_key=b.gregorian_calendar_key
JOIN ldb.d_calendar_date_fiscal c ON b.fiscal_calendar_key=c.row_key
JOIN ldb.d_calendar_fiscal_period d ON c.period_start_date_key=d.row_key
UNION 
SELECT 'd_calendar_date_fiscal' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_response a
JOIN ldb.d_calendar_greg_fiscal b ON a.requested_on_key=b.gregorian_calendar_key
JOIN ldb.d_calendar_date_fiscal c ON b.fiscal_calendar_key=c.row_key
UNION 
SELECT 'd_calendar_fiscal_year' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_response a
JOIN ldb.d_calendar_greg_fiscal b ON a.requested_on_key=b.gregorian_calendar_key
JOIN ldb.d_calendar_date_fiscal c ON b.fiscal_calendar_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
UNION 
SELECT 'd_internal_contact_assigned_to' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_response a 
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key
UNION 
SELECT 'd_survey_state' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_response a 
JOIN ldb.d_survey_state b on a.survey_state_src_key=b.row_key


