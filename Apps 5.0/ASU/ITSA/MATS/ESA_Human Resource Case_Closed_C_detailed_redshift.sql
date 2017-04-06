SELECT 'ldb.f_hr_case_closed' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
UNION 
SELECT 'ldb.d_hr_case' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 ON (a11.hr_case_key=a12.row_key)
UNION 
SELECT 'ldb.d_lov_hrcase_category_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 ON (a11.hr_case_key=a12.row_key)
JOIN ldb.d_lov_hrcase_category_c a13 ON (a12.category_src_key=a13.row_key)
UNION
SELECT 'ldb.d_lov_hrcase_contact_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 ON (a11.hr_case_key=a12.row_key)
JOIN ldb.d_lov_hrcase_contact_c a14 ON (a12.contact_type_src_c_key = a14.row_key)
UNION 
SELECT 'ldb.d_lov_hrcase_customer_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 ON (a11.hr_case_key=a12.row_key)
JOIN ldb.d_lov_hrcase_customer_c a15 ON (a12.customer_type_src_c_key = a15.row_key)
UNION 
SELECT 'ldb.d_hr_case_state' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 ON (a11.hr_case_key=a12.row_key)
JOIN ldb.d_hr_case_state a16 ON (a12.state_src_key = a16.row_key)
UNION 
SELECT 'ldb.d_lov_hrcase_subcategory_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 ON (a11.hr_case_key=a12.row_key)
JOIN ldb.d_lov_hrcase_subcategory_c a17 ON (a12.sub_category_src_key = a17.row_key)
UNION 
SELECT 'ldb.d_calendar_date' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_calendar_date a18 ON (a11.closed_on_key = a18.row_key)
UNION 
SELECT 'ldb.d_internal_contact' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_internal_contact a19 ON (a11.closed_by_key = a19.row_key)
UNION 
SELECT 'ldb.d_calendar_month' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_calendar_date a18 ON (a11.closed_on_key = a18.row_key)
JOIN ldb.d_calendar_month a110 ON (a18.month_start_date_key = a110.row_key)
UNION 
SELECT 'ldb.d_hr_case_opened_for' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case_opened_for a20 ON (a11.opened_for_key = a20.row_key)
UNION 
SELECT 'd_internal_contact_assigned_to' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_internal_contact_assigned_to a20 ON (a11.assigned_to_key = a20.row_key)
UNION 
SELECT 'ldb.d_internal_contact_mdm' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_internal_contact a19 ON (a11.closed_by_key = a19.row_key)
JOIN ldb.d_internal_contact_mdm a21 ON (a19.row_current_key=a21.row_current_key)
UNION 
SELECT 'ldb.d_hr_case_priority' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 ON (a11.hr_case_key=a12.row_key)
JOIN ldb.d_hr_case_priority a16 ON (a12.Priority_src_key = a16.row_key)
UNION 
SELECT 'ldb.d_internal_organization_department' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_internal_contact a19 ON (a11.closed_by_key = a19.row_key)
JOIN  ldb.d_internal_organization_department a20 ON (a19.department_key=a20.row_key)
UNION 
SELECT 'ldb.d_location' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_location a19 ON (a11.location_key = a19.row_key)
UNION 
SELECT 'ldb.d_internal_organization_group' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_internal_organization_group a19 ON (a11.assignment_group_key = a19.row_key)
UNION 
select  'ldb.d_lov_hr_case_dormancy_age_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_closed    a
join  ldb.d_lov_hr_case_dormancy_age_c b on (a.dormancy_age_key = b.row_key)
UNION 
select  'd_hr_case_agebucket' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_closed    a
join  ldb.d_hr_case_agebucket b on (a.age_key = b.row_key)




