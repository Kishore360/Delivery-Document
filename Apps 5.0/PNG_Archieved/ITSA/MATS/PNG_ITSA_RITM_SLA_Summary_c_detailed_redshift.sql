/* d_ag_manager_role_vp_dir_ad_c done 
d_ag_manager_role_vp_dir_ad_task_sla_owner_c done 
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_year
d_internal_contact_ad_sla_owner_c done 
d_internal_contact_associate_director_c done 
d_internal_contact_director_c done 
d_internal_contact_director_sla_owner_c done 
d_internal_contact_vp_c done  
d_internal_contact_vp_sla_owner_c done 
d_internal_organization_vendor_company_c done 
d_request_item done 
d_sc_req_item_priority done 
d_task_sla done 
d_task_sla_stage done
f_request_item_task_sla_c */



SELECT 'ldb.f_request_item_task_sla_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
UNION 
SELECT 'ldb.d_task_sla' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_task_sla a12 ON a11.sla_key=a12.row_key
UNION 
SELECT 'ldb.d_task_sla_stage' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_task_sla_stage a12 ON a11.stage_src_key=a12.row_key
UNION 
SELECT 'ldb.d_request_item' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_request_item a12 ON a11.request_item_key=a12.row_key
UNION 
SELECT 'ldb.d_sc_req_item_priority' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_sc_req_item_priority a12 ON a11.priority_src_key=a12.row_key
UNION 
SELECT 'ldb.d_internal_organization_vendor_company_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_task_sla a12 ON a11.sla_key=a12.row_key
JOIN ldb.d_internal_organization_vendor_company_c a13 ON a12.vendor_c_key=a13.row_key
UNION 
SELECT 'ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_task_sla a12 ON a11.sla_key=a12.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a13 ON a12.u_owned_by_c_key=a13.row_key
UNION 
SELECT 'ldb.d_ag_manager_role_vp_dir_ad_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_ag_manager_role_vp_dir_ad_c a12 ON a11.assignment_group_key=a12.internal_organization_key
UNION 
SELECT 'ldb.d_internal_contact_ad_sla_owner_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_task_sla a12 ON a11.sla_key=a12.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a13 ON a12.u_owned_by_c_key=a13.row_key
JOIN ldb.d_internal_contact_ad_sla_owner_c a14 ON a13.associate_director_key=a14.row_key
UNION 
SELECT 'ldb.d_internal_contact_associate_director_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_task_sla a12 ON a11.sla_key=a12.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a13 ON a12.u_owned_by_c_key=a13.row_key
JOIN ldb.d_internal_contact_associate_director_c a14 ON a13.associate_director_key=a14.row_key
UNION 
SELECT 'ldb.d_internal_contact_vp_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_ag_manager_role_vp_dir_ad_c a12 ON a11.assignment_group_key=a12.internal_organization_key
JOIN ldb.d_internal_contact_vp_c a13 ON a12.vp_key=a13.row_key
UNION 
SELECT 'ldb.d_internal_contact_vp_sla_owner_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_task_sla a12 ON a11.sla_key=a12.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a13 ON a12.u_owned_by_c_key=a13.row_key
JOIN ldb.d_internal_contact_vp_sla_owner_c a14 ON a13.vp_key=a14.row_key
UNION 
SELECT 'ldb.d_internal_contact_director_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_ag_manager_role_vp_dir_ad_c a12 ON a11.assignment_group_key=a12.internal_organization_key
JOIN ldb.d_internal_contact_director_c a13 ON a12.director_key=a13.row_key
UNION 
SELECT 'ldb.d_internal_contact_director_sla_owner_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_task_sla a12 ON a11.sla_key=a12.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a13 ON a12.u_owned_by_c_key=a13.row_key
JOIN ldb.d_internal_contact_director_sla_owner_c a14 ON a13.director_key=a14.row_key
UNION 
SELECT 'ldb.d_calendar_date' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_calendar_date a12 ON a11.start_on_key=a12.row_key
UNION 
SELECT 'ldb.d_calendar_month' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_calendar_date a12 ON a11.start_on_key=a12.row_key
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key
UNION 
SELECT 'ldb.d_calendar_quarter' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_calendar_date a12 ON a11.start_on_key=a12.row_key
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key
JOIN ldb.d_calendar_quarter a14 ON a13.quarter_start_date_key=a14.row_key
UNION 
SELECT 'ldb.d_calendar_year' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_request_item_task_sla_c a11
JOIN ldb.d_calendar_date a12 ON a11.start_on_key=a12.row_key
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key
JOIN ldb.d_calendar_quarter a14 ON a13.quarter_start_date_key=a14.row_key
JOIN ldb.d_calendar_year a15 ON a14.year_start_date_key=a15.row_key


