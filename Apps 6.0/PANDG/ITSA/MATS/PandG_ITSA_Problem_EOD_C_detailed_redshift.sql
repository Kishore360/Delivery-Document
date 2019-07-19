/* f_problem_eod_current_c
d_internal_organization_group
d_ag_manager_role_vp_dir_ad_c
d_internal_contact_director_c
d_business_service
d_eod_date_filter_c
d_impacted_cbp_eod_c
d_internal_contact_associate_director_c
d_internal_contact_vp_c */


SELECT 'f_problem_eod_current_c' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a 
UNION 
SELECT 'd_internal_organization_group' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key 
UNION 
SELECT 'd_ag_manager_role_vp_dir_ad_c' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key 
UNION 
SELECT 'd_ag_manager_role_vp_dir_ad_c' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key 
UNION 
SELECT 'd_internal_contact_director_c' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key 
JOIN ldb.d_internal_contact_director_c c ON b.director_key=c.row_key
UNION 
SELECT 'd_business_service' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
UNION 
SELECT 'd_eod_date_filter_c' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.row_key 
UNION 
SELECT 'd_impacted_cbp_eod_c' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_impacted_cbp_eod_c b ON a.critical_business_process_c_key=b.row_key
UNION 
SELECT 'd_internal_contact_associate_director_c' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key 
JOIN ldb.d_internal_contact_associate_director_c c ON b.associate_director_key=c.row_key 
UNION 
SELECT 'd_internal_contact_vp_c' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem_eod_current_c a
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key 
JOIN ldb.d_internal_contact_vp_c c ON b.vp_key=c.row_key 





