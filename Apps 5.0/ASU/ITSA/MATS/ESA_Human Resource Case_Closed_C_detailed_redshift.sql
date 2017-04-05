SELECT 'ldb.f_hr_case_closed ' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
UNION 
SELECT 'ldb.d_hr_case' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 on (a11.hr_case_key = a12.row_key)
UNION 
SELECT 'ldb.d_lov_hrcase_category_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 on (a11.hr_case_key = a12.row_key)
JOIN ldb.d_lov_hrcase_category_c a13 on (a12.category_src_key = a13.row_key)
UNION 
SELECT 'ldb.d_lov_hrcase_contact_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 on (a11.hr_case_key = a12.row_key)
JOIN ldb.d_lov_hrcase_contact_c a14 on (a12.contact_type_src_c_key = a14.row_key)
UNION 
SELECT 'ldb.d_lov_hrcase_customer_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 on (a11.hr_case_key = a12.row_key)
JOIN ldb.d_lov_hrcase_customer_c a15 on (a12.customer_type_src_c_key = a15.row_key)
UNION 
SELECT 'ldb.d_lov_hrcase_state_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 on (a11.hr_case_key = a12.row_key)
JOIN ldb.d_hr_case_state a16 ON (a12.state_src_key = a16.row_key)
UNION 
SELECT 'ldb.d_lov_hrcase_subcategory_c' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_hr_case a12 on (a11.hr_case_key = a12.row_key)
JOIN ldb.d_lov_hrcase_subcategory_c a17 on (a12.sub_category_src_key = a17.row_key)
UNION 
SELECT 'ldb.d_calendar_date' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_calendar_date a18 on (a11.closed_on_key = a18.row_key)
UNION 
SELECT 'ldb.d_internal_contact' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_internal_contact a19 on (a11.closed_by_key = a19.row_key)
UNION 
SELECT 'ldb.d_calendar_month' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_calendar_date a18 on (a11.closed_on_key = a18.row_key)
JOIN ldb.d_calendar_month a110 on (a18.month_start_date_key = a110.row_key)
UNION 
SELECT 'ldb.d_calendar_month' as TABLE_NAME, COUNT(a11.row_key) AS ROW_COUNT 
FROM ldb.f_hr_case_closed a11
JOIN ldb.d_sm_category a111 on (a11.sm_category_key = a111.row_key)
	   
			   
              
           
                
                