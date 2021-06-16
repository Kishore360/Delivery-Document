/* Tables Accessed:
d_calendar_date done
d_calendar_month done
d_calendar_quarter done
d_calendar_year done 
d_lov_ccpa_processing_activities_data_subject_type_c done 
d_lov_ccpa_processing_activities_ot_life_cycle_status_c done 
d_png_ccpa_processing_activities_inventory_c done 
d_png_ot_ccpa_compliance_control_c done 
d_png_ot_ccpa_validation_control_c done 
d_processing_activities_ccpa_age_class_c done 
d_processing_activities_ccpa_owning_organization_c done 
f_png_ot_ccpa_validation_control_c */


SELECT 'f_png_ot_ccpa_validation_control_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c
UNION 
SELECT 'd_processing_activities_ccpa_owning_organization_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_processing_activities_ccpa_owning_organization_c b ON a.ccpa_owning_organization_c_key=b.row_key
UNION 
SELECT 'd_png_ccpa_processing_activities_inventory_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key 
UNION 
SELECT 'd_processing_activities_ccpa_age_class_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key 
JOIN ldb.d_processing_activities_ccpa_age_class_c c ON b.ccpa_age_class_c_key=c.row_key
UNION 
SELECT 'd_png_ot_ccpa_validation_control_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_png_ot_ccpa_validation_control_c b ON a.ccpa_validation_control_key=b.row_key
UNION 
SELECT 'd_lov_ccpa_processing_activities_ot_life_cycle_status_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key 
JOIN ldb.d_lov_ccpa_processing_activities_ot_life_cycle_status_c c ON b.ot_ccpa_life_cycle_status_c_key=c.row_key
UNION 
SELECT 'd_lov_ccpa_processing_activities_data_subject_type_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_png_ccpa_processing_activities_inventory_c b ON a.png_ot_ccpa_numerita_c_key=b.row_key 
JOIN ldb.d_lov_ccpa_processing_activities_data_subject_type_c c ON b.data_subject_type_c_key=c.row_key
UNION 
SELECT 'd_calendar_date' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
UNION 
SELECT 'd_calendar_month' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_quarter' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_calendar_quarter d ON c.quarter_start_date_key=d.row_key
UNION 
SELECT 'd_calendar_year' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
JOIN ldb.d_calendar_quarter d ON c.quarter_start_date_key=d.row_key
JOIN ldb.d_calendar_year e ON d.year_start_date_key=e.row_key 

UNION 
SELECT 'd_png_ot_ccpa_compliance_control_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_png_ot_ccpa_validation_control_c a 
JOIN ldb.d_png_ot_ccpa_compliance_control_c b ON a.ccpa_compliance_control_key=b.row_key




