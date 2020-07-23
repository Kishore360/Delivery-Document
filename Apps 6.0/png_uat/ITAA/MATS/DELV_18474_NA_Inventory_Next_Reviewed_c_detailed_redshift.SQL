/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_year
d_lov_ccpa_processing_activities_data_subject_type_c done 
d_lov_ccpa_processing_activities_ot_life_cycle_status_c done 
d_lov_processing_activities_ccpa_data_stakeholders_c done 
d_lov_processing_activities_ccpa_databreach_status_c done 
d_lov_processing_activities_ccpa_dataretension_status_c done 
d_lov_processing_activities_ccpa_lawful_basis_status_c done 
d_lov_processing_activities_ccpa_notice_status_c done 
d_lov_processing_activities_ccpa_repository_sub_type_c done
d_lov_processing_activities_ccpa_repository_type_c done 
d_lov_processing_activities_ccpa_scope_number_c done 
d_lov_processing_activities_ccpa_subject_rights_c done 
d_lov_processing_activities_ccpa_vendor_qualification_c done 
d_lov_processing_activities_ccpa_vendor_status_c done 
d_png_ccpa_processing_activities_inventory_c done 
d_processing_activities_ccpa_age_class_c done 
d_processing_activities_ccpa_compliance_priority_two_c done 
d_processing_activities_ccpa_countries_collected_c done 
d_processing_activities_ccpa_owning_organization_c done 
f_png_ot_ccpa_numerita_next_reviewed_c done  */


SELECT 'f_png_ot_ccpa_numerita_next_reviewed_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
UNION 
SELECT 'd_processing_activities_ccpa_owning_organization_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_processing_activities_ccpa_owning_organization_c b ON a.ccpa_owning_organization_c_key=b.row_key
UNION 
SELECT 'd_png_ccpa_processing_activities_inventory_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
UNION 
SELECT 'd_processing_activities_ccpa_countries_collected_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_processing_activities_ccpa_countries_collected_c c ON b.ccpa_country_collected_c_key=c.row_key
UNION 
SELECT 'd_processing_activities_ccpa_compliance_priority_two_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_processing_activities_ccpa_compliance_priority_two_c c ON b.ot_ccpa_compliance_priority2_c_key=c.row_key
UNION 
SELECT 'd_processing_activities_ccpa_age_class_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_processing_activities_ccpa_age_class_c c ON b.ccpa_age_class_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_vendor_status_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_vendor_status_c c ON b.ccpa_vendor_status_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_vendor_qualification_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_vendor_qualification_c c ON b.ccpa_vendor_qualification_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_subject_rights_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_subject_rights_c c ON b.subj_rights_status_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_scope_number_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_scope_number_c c ON b.ccpa_scope_number_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_repository_type_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_repository_type_c c ON b.ccpa_repository_type_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_repository_sub_type_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_repository_sub_type_c c ON b.ccpa_subtype_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_notice_status_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_notice_status_c c ON b.ccpa_notice_status_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_lawful_basis_status_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_lawful_basis_status_c c ON b.ccpa_lawful_basis_status_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_dataretension_status_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_dataretension_status_c c ON b.data_retentions_status_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_databreach_status_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_databreach_status_c c ON b.data_breach_status_c_key=c.row_key
UNION 
SELECT 'd_lov_processing_activities_ccpa_data_stakeholders_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ccpa_data_stakeholders_c c ON b.ot_ccpa_data_stakeholders_c_key=c.row_key
UNION 
SELECT 'd_lov_ccpa_processing_activities_ot_life_cycle_status_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_ccpa_processing_activities_ot_life_cycle_status_c c ON b.ot_ccpa_life_cycle_status_c_key=c.row_key
UNION 
SELECT 'd_lov_ccpa_processing_activities_data_subject_type_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key
JOIN ldb.d_lov_ccpa_processing_activities_data_subject_type_c c ON b.data_subject_type_c_key=c.row_key
UNION 
SELECT 'd_calendar_date' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
UNION 
SELECT 'd_calendar_month' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_quarter' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_calendar_quarter d ON c.quarter_start_date_key=d.row_key
UNION 
SELECT 'd_calendar_year' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_next_reviewed_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_calendar_quarter d ON c.quarter_start_date_key=d.row_key
JOIN ldb.d_calendar_year e ON d.year_start_date_key=e.row_key


