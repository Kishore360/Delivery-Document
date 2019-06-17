/* d_ag_manager_role_vp_dir_ad_c
d_business_service
d_co_manager_role_vp_dir_ad_c
d_eod_date_filter_c
d_impacted_cbp_eod_c
d_internal_contact_change_request_ci_owned_by_c
d_internal_contact_co_associate_director_c
d_internal_contact_co_director_c
d_internal_contact_co_vp_c
d_internal_organization_group
f_change_eod_current_c */

SELECT 'f_change_eod_current_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
UNION 
SELECT 'd_internal_organization_group' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_ag_manager_role_vp_dir_ad_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_internal_contact_co_vp_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key
JOIN ldb.d_internal_contact_co_vp_c c ON b.vp_key=c.row_key
UNION 
SELECT 'd_internal_contact_co_director_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key
JOIN ldb.d_internal_contact_co_director_c c ON b.director_key=c.row_key
UNION 
SELECT 'd_internal_contact_co_associate_director_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_ag_manager_role_vp_dir_ad_c b ON a.assignment_group_key=b.row_key
JOIN ldb.d_internal_contact_co_associate_director_c c ON b.associate_director_key=c.row_key
UNION 
SELECT 'd_internal_contact_change_request_ci_owned_by_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c b ON a.owned_by_c_key=b.row_key
UNION 
SELECT 'd_impacted_cbp_eod_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_impacted_cbp_eod_c b ON a.critical_business_process_c_key=b.row_key
UNION 
SELECT 'd_business_service' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
UNION 
SELECT 'd_eod_date_filter_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.row_key
UNION 
SELECT 'd_co_manager_role_vp_dir_ad_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_change_eod_current_c a 
JOIN ldb.d_co_manager_role_vp_dir_ad_c b ON a.owned_by_c_key=b.change_owner_key




